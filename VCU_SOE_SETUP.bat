@ECHO off
title %computername%
ECHO Created by Kyle Tower with help from Kyle Welch and Google Searching various forums.
ECHO Used Scott Burke's template code for the Printers

REM ECHO Disabling UAC for this account. Requires reboot to be in effect.
REM reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f

REM Get Serial Number for use with Loading Dell.com/Drivers/SerialTag
FOR /F "tokens=2 delims='='" %%A in ('wmic Bios Get SerialNumber /value') do SET serialnumber=%%A
ECHO Serial Number is %serialnumber%


REM Run Multiple PS Commands
REM powershell -command "& {&'some-command' someParam}"; "& {&'some-command' -SpecificArg someParam}"
:Prep_PowerShell
PowerShell -command "Set-ExecutionPolicy Unrestricted -Scope CurrentUser"; 

GOTO End_Routine




:Create_Source_Target_Variables
SET "Source=S:\Software\Standard Software"
SET "Target=%UserProfile%\Desktop\TEMP"

SET "SophosSource=%Source%\Sophos\Win"
SET "SophosTarget=%Target%\Sophos"

SET "TeamViewerSource=%Source%\TeamViewer 9\Win"
SET "TeamViewerTarget=%Target%\TeamViewer"

SET "NiniteSource=%Source%\Ninite"
SET "NiniteTarget=%Target%\Ninite"

SET "MSOfficeSource=%Source%\MS Office 2016\Win\SW_DVD5_Office_Professional_Plus_2016_64Bit_English_MLF_X20-42432"
SET "MSOfficeTarget=%Target%\MS Office"

SET "LANDeskSource=%Source%\LANDesk Agents\Win"
SET "LANDeskTarget=%Target%\LANDesk"
REM Client-SOE_20163_with_status.exe

SET "SPSSSource=%Source%\SPSS\SPSS 25 for WINDOWS May 2018"
SET "SPSSTarget=%Target%\SPSS"

SET "DDPESource=%Source%\DDPE\Win\DDPE_8.18"
SET "DDPETarget=%Target%\DDPE"

SET "DefaultAppSource=S:\Software"
SET "DefaultAppTarget=%Target%\Defaults"

SET "RamsVPNSource=%Source%\Rams VPN"
SET "RamsVPNTarget=%Target%\Rams VPN"

SET "ZoomSource=%Source%\Zoom"
SET "ZoomTarget=%Target%\Zoom"

REM MAIN
GOTO Menu


REM Display Menu
:Menu
ECHO.
ECHO   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ECHO   @@                                                                      @@
ECHO   @@                      FOR VCU SOE ITS STAFF ONLY                      @@ 
ECHO   @@                 MUST RUN AS ADMINISTRATOR (ELEVATED)                 @@
ECHO   @@                                                                      @@
ECHO   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ECHO.
ECHO   0.  Get PC Info
ECHO   1.  Rename PC
ECHO   2.  Set DNS Servers of Ethernet Adapter [adapter specific]
ECHO   3.  Append DNS Suffixes
ECHO   4.  Uninstall Unnecessary Pre-Installed Software and Apps
ECHO   5.  Map Rams Server (must map server first for Installing below)
ECHO   6.  Install Sophos
ECHO   7.  Install TeamViewer 9
ECHO   8.  Install Ninite (Chrome, Firefox, Java 8, .NET 4.7, VLC)
ECHO   9.  Install MS Office 2016
ECHO   10. Install Reader [you must make it default]
ECHO   11. Install Cicsco AnyConnect VPN
ECHO   12. Install LANDesk
ECHO   13. Install SPSS
ECHO   14. Install Zoom
ECHO   15. Configure Firefox for Adblock Plus and Flash
ECHO   16. Configure Chrome for Adblock Plus
ECHO   17. Change Default App Associations [for new users and profiles]
ECHO   18. Device Manager: Ensure All Devices Have Drivers
ECHO   19. Get Dell Drivers
ECHO   20. Install Ricoh 8001 Printer (4th Floor Only)
ECHO   21. Install Ricoh 4002 Printer (Dean's Office Only)
ECHO   22. Windows Updates
ECHO   23. Install DDPE 8.18 (64-bit)
ECHO   24. Delete Desktop TEMP Files 
ECHO   25. Update LANDesk Ticket
ECHO   m. MORE OPTIONS
ECHO   x. Exit
ECHO.
SET /P number=Choice: 

IF %number%==0 GOTO Get_PC_Info
IF %number%==1 GOTO Rename_PC
IF %number%==2 GOTO Set_DNS
IF %number%==3 GOTO Append_DNS_Suffixes
IF %number%==4 GOTO Uninstall_Software
IF %number%==5 GOTO Map_Rams_Server
IF %number%==6 GOTO Install_Sophos
IF %number%==7 GOTO Install_TeamViewer
IF %number%==8 GOTO Install_Ninite
IF %number%==9 GOTO Install_MS_Office
IF %number%==10 GOTO Install_Adobe_reader
IF %number%==11 GOTO Install_Cisco_VPN
IF %number%==12 GOTO Install_LANDesk
IF %number%==13 GOTO Install_SPSS

IF %number%==14 GOTO Install_Zoom

IF %number%==15 GOTO Configure_Firefox
IF %number%==16 GOTO Configure_Chrome
IF %number%==17 GOTO Change_Defaults
IF %number%==18 GOTO Device_Manager
IF %number%==19 GOTO Get_Dell_Drivers
IF %number%==20 GOTO Install_Ricoh8001
IF %number%==21 GOTO Install_Ricoh_4002
IF %number%==22 GOTO Windows_Updates 
IF %number%==23 GOTO Install_DDPEUpdate_LANDesk_Ticket
IF %number%==24 GOTO Delete_Desktop_Temp_Files
IF %number%==25 GOTO Update_LANDesk_Ticket

IF %number%==x EXIT /B 0

IF %number%==m GOTO More_Options

:More_Options
ECHO   1.  Restart Windows
ECHO   2.  Uninstall Sophos
ECHO   3.  Fix Microsoft Office 2016 Registry
ECHO   4.  Install SPSS 25 or 24 License (valid through Dec 2018)
ECHO   5.  Forget VCU SafeNet Wireless Profile
ECHO   6.  Install Dell Driver's via .cab file
ECHO   7.  Install Chocolatey
ECHO   x.  Exit
ECHO.
ECHO   NOTES:
ECHO   Full Scan of HDD chkdsk c: /r
ECHO   dism /online /cleanup-image /restorehealth
ECHO   sfc /scannow
ECHO   Empty ALL Recycle Bins rd /s c:\$Recycle.Bin
ECHO   Defrag (Only for HDDs, not SSDs)
ECHO   defrag c: /b (Boot Defrag, only for HDDs, not SSDs)
ECHO   bcdedit /set {default} safeboot network (Boot into Safe Mode with Networking)
ECHO   bcdedit /deletevalue {default} safeboot (Normal Boot into Windows)

SET /P number=Choice: 

IF %number%==1 GOTO Restart_Windows
IF %number%==2 GOTO Uninstall_Sophos 
IF %number%==3 GOTO Fix_MS_Office_2016
IF %number%==4 GOTO SPSS_License
IF %number%==5 GOTO Forget_VCU_Wifi
IF %number%==6 GOTO Install_Dell_Cab
IF %number%==7 GOTO Install_Chocolatey
IF %number%==x GOTO Menu

:End_Routine
REM 
rundll32 user32.dll,MessageBeep
REM rundll32.exe cmdext.dll,MessageBeepStub

PAUSE
GOTO Menu



:Install_Chocolatey
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install -y adobereader
choco install -y flashplayerplugin
choco install -y googlechrome
choco install -y jre8
choco install -y flashplayeractivex
choco install -y firefox
choco install -y vlc
choco install -y ccleaner
choco install -y adblockplusie
choco install -y adblockpluschrome
choco install -y adblockplusfirefox
choco install -y teamviewer
choco install -y youtube-dl
choco install -y ffmpeg
choco install -y windirstat
choco install -y dotnet4.0
choco install -y audacity
choco install -y audacity-lame
choco install -y rufus

choco install -y notepadplusplus.install
choco install -y atom
choco install -y python3
choco install -y vscode
choco install -y vscode-csharp
choco install -y unity
choco install -y unitywebplayer

REM choco install pstools
REM choco install psexec
REM choco install teracopy
REM choco install sudo

REM choco install zotero-standalone
REM choco install nsis
REM choco install googlechrome-allusers
REM choco install handbrake.install
REM choco install kodi
REM choco install autoit
REM choco install discord
REM choco install makemkv

GOTO End_Routine


:Install_Zoom
robocopy "%ZoomSource%" "%ZoomTarget%" ZoomInstallerFull.msi
cd %ZoomTarget%
msiexec /i ZoomInstallerFull.msi /quiet /qn /norestart /log install.log ZoomAutoUpdate="true" ZSSOHOST="vcu.zoom.us" ZConfig="nogoogle=1;nofacebook=1;login_domain=vcu.edu;AddFWException=1;kCmdParam_InstallOption=8"
GOTO End_Routine



:Install_Dell_Cab
ECHO With the introduction of Windows Vista, Windows will not prompt the "Found New Hardware" Wizard 
ECHO any longer and the installation occurs silently. The end user will only see Windows UA prompts 
ECHO for unsigned driver. Total runtime ~ 10 - 15 minutes depending on number of driver in the CAB file.

cd /
md Drivers
expand "%userprofile%\downloads\*.CAB" c:\Drivers -f:*
cd Drivers
for /f "tokens=*" %a in ('dir *.inf /b /s') do (pnputil –i -a "%a\..\*.inf")

GOTO End_Routine




:Forget_VCU_Wifi
netsh wlan delete profile name="VCU SafeNet Wireless"

GOTO End_Routine


:Install_Dell_Cab


pause
GOTO End_Routine


:Uninstall_Sophos
REM Modifying Services

net stop "Sophos Agent" >NUL 2>&1
net stop "Sophos Anti-Virus" >NUL 2>&1
net stop "Sophos Anti-Virus status reporter" >NUL 2>&1
net stop "Sophos AutoUpdate Service" >NUL 2>&1
net stop "Sophos Message Router" >NUL 2>&1
net stop "Sophos Web Intelligence Service" >NUL 2>&1
net stop "Sophos Client Firewall" >NUL 2>&1
net stop "Sophos Client Firewall Manager" >NUL 2>&1
net stop "Sophos Web Control Service" >NUL 2>&1
sc config sharedaccess start= disabled >NUL 2>&1
sc config browser start= auto >NUL 2>&1
sc config remoteregistry start= auto >NUL 2>&1
sc config lanmanserver start= auto >NUL 2>&1
sc config schedule start= auto >NUL 2>&1
sc config msiserver start= auto >NUL 2>&1
sc config lanmanworkstation start= auto >NUL 2>&1
net stop sharedaccess >NUL 2>&1
net start lanmanworkstation >NUL 2>&1
net start msiserver >NUL 2>&1
net start schedule >NUL 2>&1
net start lanmanserver >NUL 2>&1
net start remoteregistry >NUL 2>&1
net start browser >NUL 2>&1

REM Performing MSI Uninstall
msiexec.exe /x "c:\program files\sophos\autoupdate\cache\savxp\sophos anti-virus.msi" /q /norestart >NUL 2>&1
msiexec.exe /x "c:\program files\sophos\autoupdate\cache\rms\sophos remote management system.msi" /q /norestart >NUL 2>&1
msiexec.exe /x "c:\program files\sophos\autoupdate\cache\sau\sophos autoupdate.msi" /q /norestart >NUL 2>&1
msiexec.exe /x "c:\program files\sophos\autoupdate\cache\scf\sophos client firewall.msi" /q /norestart >NUL 2>&1
reg delete HKLM\Software\Sophos /f >NUL 2>&1
reg delete HKCU\Software\Sophos /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos Agent" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SavService" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SAVAdminService" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos AutoUpdate Agent" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos AutoUpdate Service" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos Certification Manager" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos EMLib Update Agent" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SEMscheduler" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos Management Service" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos Message Router" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SQLAgent$SOPHOS" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MSSQL$SOPHOS" /f >NUL 2>&1
reg delete "HKLM\System\CurrentControlSet\Services\Eventlog\Sophos" /f >NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\ISPSheet" /f >NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\ISPSheet.1" /f >NUL 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{061CC07B-BA7A-44D1-81FA-D36BE1CE55D9}" /f >NUL 2>&1
TASKKILL /F /IM "Almon.exe" >NUL 2>&1
TASKKILL /F /IM "swc_service.exe" >NUL 2>&1

REM Uninstall Sophos Network Threat Protection
MsiExec.exe /X {66967E5F-43E8-4402-87A4-04685EE5C2CB} /qn REBOOT=SUPPRESS /L*v %windir%\Logs\Uninstall_NTP_Log.txt

REM Uninstall Sophos System Protection
MsiExec.exe /X {1093B57D-A613-47F3-90CF-0FD5C5DCFFE6} /qn REBOOT=SUPPRESS /L*v %windir%\Logs\Uninstall_SSP_Log.txt

REM Uninstall Sophos Anti-Virus
MsiExec.exe /X {65323B2D-83D4-470D-A209-D769DB30BBDB} /qn REBOOT=SUPPRESS /L*v %windir%\Logs\Uninstall_SAV_Log.txt
MsiExec.exe /X {D929B3B5-56C6-46CC-B3A3-A1A784CBB8E4} /qn REBOOT=SUPPRESS /L*v %windir%\Logs\Uninstall_SAV_Log.txt
MsiExec.exe /X {09863DA9-7A9B-4430-9561-E04D178D7017} /qn REBOOT=SUPPRESS /L*v %windir%\Logs\Uninstall_SAV_Log.txt
MsiExec.exe /X {CA3CE456-B2D9-4812-8C69-17D6980432EF} /qn REBOOT=SUPPRESS /L*v %windir%\Logs\Uninstall_SAV_Log.txt

REM Uninstall Sophos Remote Management System
MsiExec.exe /X {FED1005D-CBC8-45D5-A288-FFC7BB304121} /qn REBOOT=SUPPRESS /L*v %windir%\Logs\Uninstall_RMS_Log.txt

REM Uninstall Sophos AutoUpdate
MsiExec.exe /X {AFBCA1B9-496C-4AE6-98AE-3EA1CFF65C54} /qn REBOOT=SUPPRESS /L*v %windir%\Logs\Uninstall_SAU_Log.txt

REM Uninstall Sophos Endpoint Defense
"C:\Program Files\Sophos\Endpoint Defense\uninstall.exe" /S REBOOT=SUPPRESS /L*v %windir%\Logs\Uninstall_SED_Log.txt

REM y | rd /s "C:\Program Files\Sophos\"
REM y | rd /s "C:\Program Files (x86)\Sophos\"
REM y | rd /s "C:\Documents and Settings\All Users\Application Data\Sophos\"
REM y | rd /s "C:\ProgramData\Sophos\"

WMIC product where "Name LIKE '%%sophos%%'" call uninstall /nointeractive

REM y | rd /s "C:\Program Files\Sophos\"
REM y | rd /s "C:\Program Files (x86)\Sophos\"
REM y | rd /s "C:\Documents and Settings\All Users\Application Data\Sophos\"
REM y | rd /s "C:\ProgramData\Sophos\"

cd C:\Program Files (x86)\Sophos\Sophos Anti-Virus
rename sophos_detoured.dll sophos_detoured.old.dll
rename sophos_detoured_x64.dll sophos_detoured_x64.old.dll

REM Performing Registry Cleanup
reg delete HKLM\Software\Sophos /f >NUL 2>&1
reg delete HKCU\Software\Sophos /f >NUL 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows\AppInit_DLLs" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos Agent" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SavService" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SAVAdminService" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos AutoUpdate Agent" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos AutoUpdate Service" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos Certification Manager" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos EMLib Update Agent" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SEMscheduler" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos Management Service" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\Sophos Message Router" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SQLAgent$SOPHOS" /f >NUL 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\MSSQL$SOPHOS" /f >NUL 2>&1
reg delete "HKLM\System\CurrentControlSet\Services\Eventlog\Sophos" /f >NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\ISPSheet" /f >NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\ISPSheet.1" /f >NUL 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\{061CC07B-BA7A-44D1-81FA-D36BE1CE55D9}" /f >NUL 2>&1

SC create SopReg binpath= "cmd /K START /WAIT REGEDIT /S %TEMP%\SOTMP.REG" type= own type= interact >NUL 2>&1 >NUL
sc start "SopReg" >NUL 2>&1 >NUL
sc delete "SopReg" >NUL 2>&1 >NUL

REM Deleting Sophos Services
sc delete SAVService >NUL 2>&1
sc delete SAVAdminService >NUL 2>&1
sc delete "Sophos Agent" >NUL 2>&1
sc delete "Sophos AutoUpdate Agent" >NUL 2>&1
sc delete "Sophos AutoUpdate Service" >NUL 2>&1
sc delete "Sophos Message Router" >NUL 2>&1
sc delete "swi_service" >NUL 2>&1
sc delete "Sophos Client Firewall" >NUL 2>&1
sc delete "Sophos Client Firewall Manager" >NUL 2>&1
sc delete "Sophos Web Control Service" >NUL 2>&1
sc delete "Sophos Device Control Service" >NUL 2>&1
sc delete swi_update_64 >NUL 2>&1

REM Unregistering DLLs
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\backgroundscanning.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\componentmanager.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\configuration.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\desktopmessaging.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\driveprocessor.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\eeconsumer.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\filterprocessors.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\fsdecomposer.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\icadapter.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\icmanagement.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\icprocessors.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\legacyconsumers.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\localisation.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\logging.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\persistance.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\SAVI0.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\SAVMSCM.DLL" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\savshellext.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\scaneditexports.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\scaneditfacade.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\scanmanagement.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\security.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\sophtaineradapter.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\systeminformation.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\threatdetection.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\threatmanagement.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\translators.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\Sophos Anti-Virus\virusdetection.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\AutoUpdate\cidsync.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\AutoUpdate\config.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\AutoUpdate\inetconn.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\AutoUpdate\InstlMgr.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\AutoUpdate\ispsheet.dll" >NUL 2>&1
regsvr32 /u /s "%PROGRAMFILES%\Sophos\AutoUpdate\logger.dll" >NUL 2>&1

REM Removing the Sophos Installation Files
RD /s /Q %TEMP% >NUL 2>&1
MD %TEMP% >NUL 2>&1
RD /s /Q %WINDIR%\TEMP\ >NUL 2>&1
MD %WINDIR%\Temp >NUL 2>&1
RD /S /Q "%PROGRAMFILES%\SOPHOS\AutoUpdate" >NUL 2>&1
RD /S /Q "%PROGRAMFILES%\SOPHOS\Sophos Anti-Virus" >NUL 2>&1
RD /S /Q "%PROGRAMFILES%\SOPHOS\Remote Management System" >NUL 2>&1
RD /S /Q "%PROGRAMFILES%\SOPHOS\" >NUL 2>&1
RD /S /Q "C:\SAVXPSA" >NUL 2>&1
RD /s /Q "%ALLUSERSPROFILE%\Start Menu\Programs\Sophos" >NUL 2>&1
RD /S /Q "%ALLUSERSPROFILE%\Application Data\Sophos" >NUL 2>&1
RD /S /Q "%USERPROFILE%\Application Data\Sophos" >NUL 2>&1
DEL /Q "%ALLUSERSPROFILE%\Start Menu\Programs\Startup\AutoUpdate Monitor.lnk" >NUL 2>&1
RD /S /Q "%WINDIR%\Installer\{09C6BF52-6DBA-4A97-9939-B6C24E4738BF}" >NUL 2>&1
RD /S /Q "%WINDIR%\Installer\{15C418EB-7675-42be-B2B3-281952DA014D}" >NUL 2>&1
RD /S /Q "%WINDIR%\Installer\{C12953C2-4F15-4A6C-91BC-511B96AE2775}" >NUL 2>&1
RD /S /Q "%WINDIR%\Installer\{FF11005D-CBC8-45D5-A288-25C7BB304121}" >NUL 2>&1
RD /S /Q "%WINDIR%\Installer\{387EF71D-9F19-4059-B6E5-B29E521AF040}" >NUL 2>&1
DEL /Q "%WINDIR%\System32\Drivers\savonaccesscontrol. sys" >NUL 2>&1
DEL /Q "%WINDIR%\System32\Drivers\savonaccessfilter.s ys" >NUL 2>&1
IF EXIST "C:\Program Files\Sophos" rmdir "C:\Program Files\Sophos" /s /q >NUL 2>&1
IF EXIST "C:\Program Files (x86)\Sophos" rmdir "C:\Program Files (x86)\Sophos" /s /q >NUL 2>&1
REM.
REM Done

GOTO DONE


:DONE
REM.
REM ====================================================
REM All done!
REM ====================================================
REM.

GOTO End_Routine 


:Change_Defaults
REM The two lines below will set the default pdf viewer to Adobe Acrobat
assoc .pdf=AcroRd32.exe
ftype AcroRd32.exe="c:\program files (x86)\adobe\acrobat reader dc\reader\AcroRd32.exe" "%%1"

REM I ran the line of code below on a computer with all default app associations up
REM dism /online /Export-DefaultAppAssociations:"%UserProfile%\Desktop\MyDefaultAppAssociations.xml"
REM I copied the .xml file to the shared drive
robocopy "%DefaultAppSource%" "%DefaultAppTarget%" MyDefaultAppAssociations.xml

REM This will set the current PC to use the same app associations as the .xml file (Chrome as Browser, Adobe as PDF, VLC as video and music, etc)
REM These settings can still be changed by the user.
dism /online /Import-DefaultAppAssociations:"%DefaultAppTarget%\MyDefaultAppAssociations.xml"

GOTO End_Routine


:Get_Dell_Drivers
REM This will launch the dell website for the drivers for the detected model based on its serial number
REM I was hoping for a simpler URL and there may be one such as: dell.com/drivers/SerialTag ???
start chrome http://www.dell.com/support/home/us/en/19/product-support/servicetag/%serialnumber%/drivers http://en.community.dell.com/techcenter/enterprise-client/w/wiki/2065.dell-command-deploy-driver-packs-for-enterprise-client-os-deployment
 
GOTO End_Routine


:Get_PC_Info
REM SOURCE: https://community.spiceworks.com/canonical_answer_pages/555-need-to-run-a-batch-file-on-multiple-servers
winver.exe
if %os%==Windows_NT goto WINNT
goto NOCON

:WINNT
echo .Using a Windows NT based system
echo ..%computername%

REM set variables
set system=
set manufacturer=
set model=
set serialnumber=
set osname=
set sp=
setlocal ENABLEDELAYEDEXPANSION
set "volume=C:"
set totalMem=
set availableMem=
set usedMem=
set IPv4=
set Domain=

echo Getting data [Computer: %computername%]...
echo Please Wait....

REM Get Computer Name
FOR /F "tokens=2 delims='='" %%A in ('wmic OS Get csname /value') do SET system=%%A

REM Get Computer Manufacturer
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Manufacturer /value') do SET manufacturer=%%A

REM Get Computer Model
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Model /value') do SET model=%%A

REM Get Computer Serial Number
FOR /F "tokens=2 delims='='" %%A in ('wmic Bios Get SerialNumber /value') do SET serialnumber=%%A

REM Get Computer OS
FOR /F "tokens=2 delims='='" %%A in ('wmic os get Name /value') do SET osname=%%A
FOR /F "tokens=1 delims='|'" %%A in ("%osname%") do SET osname=%%A

REM Get Computer OS SP
FOR /F "tokens=2 delims='='" %%A in ('wmic os get ServicePackMajorVersion /value') do SET sp=%%A

REM Get Memory
FOR /F "tokens=4" %%a in ('systeminfo ^| findstr Physical') do if defined totalMem (set availableMem=%%a) else (set totalMem=%%a)
set totalMem=%totalMem:,=%
set availableMem=%availableMem:,=%
set /a usedMem=totalMem-availableMem

FOR /f "tokens=1*delims=:" %%i IN ('fsutil volume diskfree %volume%') DO (
    SET "diskfree=!disktotal!"
    SET "disktotal=!diskavail!"
    SET "diskavail=%%j"
)
FOR /f "tokens=1,2" %%i IN ("%disktotal% %diskavail%") DO SET "disktotal=%%i"& SET "diskavail=%%j"


echo done!

echo --------------------------------------------
echo System Name: %system%
echo Manufacturer: %manufacturer%
echo Model: %model%
echo Serial Number: %serialnumber%
echo Operating System: %osname%
echo C:\ Total: %disktotal:~0,-9% GB
echo C:\ Avail: %diskavail:~0,-9% GB
echo Total Memory: %totalMem%
echo Used  Memory: %usedMem%
echo Computer Processor: %processor_architecture%
echo Service Pack: %sp%
echo --------------------------------------------
GOTO End_Routine


:NOCON
echo Error...Invalid Operating System...
echo Error...No actions were made...
GOTO End_Routine


:Device_Manager
REM Ensure that all drivers are up to date in the device manager.
devmgmt.msc
GOTO End_Routine


:Restart_Windows
shutdown -r -t 0
GOTO End_Routine



:Rename_PC
SET old_name=%computername%
REM alternatively SET old_name=%hostname%
SET /P new_name=Type New Computer Name:
WMIC computersystem where caption='%old_name%' rename %new_name%
GOTO End_Routine



:Create_SOE_Admin
REM prompt for masked password and store in password
set "psCommand=powershell -Command "$pword = read-host 'Enter Password for SOE Admin' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
REM ECHO %password%

net user "SOE Admin" %password% /add
net localgroup administrators "SOE Admin" /add

GOTO End_Routine


:Enable_Administrator
REM net user [username [password | *] [options]] [/domain]
REM control userpasswords2 to verify
REM should I remove the SOE Admin from users?

REM prompt for masked password and store in password
set "psCommand=powershell -Command "$pword = read-host 'Enter Password for SOE Admin' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
REM ECHO %password%
net user Administrator %password% /active:yes
GOTO End_Routine


REM Set DNS … Append these DNS Suffixes
:Set_DNS
REM Source: https://superuser.com/questions/463096/change-dns-with-script
SETLOCAL EnableDelayedExpansion
SET adapterName=

FOR /F "tokens=* delims=:" %%a IN ('IPCONFIG ^| FIND /I "ETHERNET ADAPTER"') DO (
SET adapterName=%%a

REM Removes "Ethernet Adapter" from the front of the adapter name
SET adapterName=!adapterName:~17!

REM Removes the colon from the end of the adapter name
SET adapterName=!adapterName:~0,-1!

netsh interface ipv4 set dns name="!adapterName!" static 192.168.8.1 primary
netsh interface ipv4 add dns name="!adapterName!" 192.168.8.2 index=2
)

ipconfig /flushdns


GOTO End_Routine


REM Append DNS Suffixes
:Append_DNS_Suffixes
REM rams.adp.vcu.edu
REM vcu.edu
SETLOCAL EnableDelayedExpansion

:: Input here the 1st additional suffix
set suffix=vcu.edu

:: Get existing DNS suffixes
FOR /F "usebackq tokens=1,2* delims= " %%A in (`reg QUERY HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters /V SearchList ^| findstr REG_SZ`) do ( 
    set OLD_DNS=%%C
)

:: Check if it starts with our suffix
set OK=NO
FOR /F "tokens=1,2* delims=," %%A in ("%OLD_DNS%") do (
    if "%%A" == "%suffix%" set OK=YES
)

:: Add our suffix first if it's not there
if "%OK%" == "NO" (
    ECHO Conf KO: %OLD_DNS%
    reg add HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters /V SearchList /D "%suffix%,%OLD_DNS%" /F
) else (
    ECHO Conf OK: %OLD_DNS%
)

:: Input here the 2nd additional suffix
set suffix=rams.adp.vcu.edu

:: Get existing DNS suffixes
FOR /F "usebackq tokens=1,2* delims= " %%A in (`reg QUERY HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters /V SearchList ^| findstr REG_SZ`) do ( 
    set OLD_DNS=%%C
)

:: Check if it starts with our suffix
set OK=NO
FOR /F "tokens=1,2* delims=," %%A in ("%OLD_DNS%") do (
    if "%%A" == "%suffix%" set OK=YES
)

:: Add our suffix first if it's not there
if "%OK%" == "NO" (
    ECHO Conf KO: %OLD_DNS%
    reg add HKLM\SYSTEM\CurrentControlSet\services\Tcpip\Parameters /V SearchList /D "%suffix%,%OLD_DNS%" /F
) else (
    ECHO Conf OK: %OLD_DNS%
)

ipconfig /flushdns
GOTO End_Routine


REM Uninstall pre-installed software, MS Office, McAfee, Dell Digital, Get Office, OneDrive, Netflix, News, Sketchbook, Skype Preview, Spotify
REM appwiz.cpl
:Uninstall_Software

@rem NOW JUST SOME TWEAKS
REM *** Show hidden files in Explorer ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f
 
REM *** Show super hidden system files in Explorer ***
REM reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 1 /f

REM *** Show file extensions in Explorer ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t  REG_DWORD /d 0 /f

REM *** Uninstall OneDrive ***
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
echo OneDrive has been removed. Windows Explorer needs to be restarted.
start /wait TASKKILL /F /IM explorer.exe
start explorer.exe

REM source: https://www.hwinfo.com/misc/RemoveW10Bloat.bat.txt
REM source: https://www.hwinfo.com/misc/RemoveW10Bloat.htm

REM msiexec.exe /X {uninstall string} /qn
REM to find uninstall string: https://archive.codeplex.com/?p=finduninstallstring

REM if you know the product name use the following
REM source: https://www.sevenforums.com/tutorials/272460-programs-uninstall-using-command-prompt-windows.html
REM wmic product where name="Adobe Acrobat Reader DC" call uninstall
REM wmic product where name="Adobe Acrobat Reader DC" call uninstall /nointeractive

REM VERY DETAILED https://www.tenforums.com/tutorials/4689-uninstall-apps-windows-10-a.html

REM List all Programs/Apps that have an Uninstaller
REM wmic product get name
REM (To be prompted Y/N to approve. Recommended)
REM wmic product where name="NameOfProgram" call uninstall

REM Remove all apps except store from new accounts created afterwards
REM Get-appxprovisionedpackage -online | where-object {$_.packagename -notlike '*store*'} | Remove-AppxProvisionedPackage -online

REM  4. To Remove All Apps except Store from New Accounts Created Afterwards
REM PowerShell -Command "Get-appxprovisionedpackage –online | where-object {$_.packagename –notlike '*store*'} | Remove-AppxProvisionedPackage -online"

REM  5. To Remove All Apps except Store from All Current Accounts on PC
REM PowerShell -Command "Get-AppxPackage -AllUsers | where-object {$_.name –notlike “*store*”} | Remove-AppxPackage"


@rem *** Disable Some Service ***
sc stop DiagTrack
sc stop diagnosticshub.standardcollector.service
sc stop dmwappushservice
sc stop WMPNetworkSvc
sc stop WSearch

sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled
REM sc config RemoteRegistry start= disabled
REM sc config TrkWks start= disabled
sc config WMPNetworkSvc start= disabled
sc config WSearch start= disabled
REM sc config SysMain start= disabled

REM *** SCHEDULED TASKS tweaks ***
REM schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /Disable

@rem *** Remove Telemetry & Data Collection ***
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f

@REM Settings -> Privacy -> General -> Let apps use my advertising ID...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f

REM - SmartScreen Filter for Store Apps: Disable
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f

REM - Let websites provide locally...
reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f

@REM WiFi Sense: HotSpot Sharing: Disable
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v value /t REG_DWORD /d 0 /f

@REM WiFi Sense: Shared HotSpot Auto-Connect: Disable
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v value /t REG_DWORD /d 0 /f

@REM Change Windows Updates to "Notify to schedule restart"
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v UxOption /t REG_DWORD /d 1 /f

@REM Disable P2P Update downlods outside of local network
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f

@REM *** Disable Cortana & Telemetry ***
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0

REM *** Hide the search box from taskbar. You can still search by pressing the Win key and start typing what you're looking for ***
REM 0 = hide completely, 1 = show only icon, 2 = show long search box
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f

REM *** Disable MRU lists (jump lists) of XAML apps in Start Menu ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f

REM *** Set Windows Explorer to start on This PC instead of Quick Access ***
REM 1 = This PC, 2 = Quick access
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f

REM *** Disable Suggestions in the Start Menu ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f 


@rem Remove Apps
REM To remove all apps except store from current user

REM ECHO removing all apps except store from current user...
REM PowerShell -Command "Get-AppXPackage | where-object {$_.name -notlike "*store*"} | Remove-AppxPackage"

REM TESTED AND WORKS
REM SOURCE: https://www.tenforums.com/software-apps/97113-updating-bat-file-removing-default-apps-2.html
REM PowerShell -Command "Get-appxpackage | where-object {$_.name -notlike '*store*'} | remove-appxpackage"
REM PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -notlike '*store*'} | remove-appxprovisionedpackage -online"

REM OTHER Apps

ECHO Removing AdobePhotoshopExpress
PowerShell -Command "Get-AppxPackage -AllUsers *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*AdobeSystemsIncorporated.AdobePhotoshopExpress*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing candyCrushSodaSaga
PowerShell -Command "Get-AppxPackage -AllUsers *king.com.CandyCrushSodaSaga* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*king.com.CandyCrushSodaSaga*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing Minecraft
PowerShell -Command "Get-AppxPackage -AllUsers *MineCraftUWP* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*MinecraftUWP*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing Twitter
PowerShell -Command "Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*Twitter*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing PicsArt
PowerShell -Command "Get-AppxPackage -AllUsers *PicsArt* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*PicsArt*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing Flipboard
PowerShell -Command "Get-AppxPackage -AllUsers *Flipboard* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*Flipboard*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing 3DBuilder
PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*3DBuilder*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing Bing
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*bing*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing MicrosoftOfficeHub
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*MicrosoftOfficeHub*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing SkypeApp
PowerShell -Command "Get-AppxPackage *Skype* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*SkypeApp*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing Solitaire
PowerShell -Command "Get-AppxPackage *solit* | Remove-AppxPackage"
PowerShell -Command "Get-AppxProvisionedPackage -online | where-object {$_.packagename -like '*solit*'} | Remove-AppxProvisionedPackage -online"

ECHO Removing Netflix
PowerShell -Command "Get-appxpackage -allusers *Netflix* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Netflix*'} | remove-appxprovisionedpackage -online"

ECHO Removing Bubble Witch
PowerShell -Command "Get-appxpackage -allusers *Witch* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Witch*'} | remove-appxprovisionedpackage -online"

ECHO Removing SketchBook
PowerShell -Command "Get-appxpackage -allusers *SketchBook* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*SketchBook*'} | remove-appxprovisionedpackage -online"

ECHO Removing Bamboo
PowerShell -Command "Get-appxpackage -allusers *Bamboo* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Bamboo*'} | remove-appxprovisionedpackage -online"

ECHO Removing OneNote
PowerShell -Command "Get-AppxPackage -AllUsers *OneNote* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*OneNote*'} | remove-appxprovisionedpackage -online"

ECHO Removing XBOX
REM PowerShell -Command "Get-AppxPackage -AllUsers *xbox* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*xbox*'} | remove-appxprovisionedpackage -online"

ECHO Removing Drawboard PDF
PowerShell -Command "Get-AppxPackage -AllUsers *Drawboard* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Drawboard*'} | remove-appxprovisionedpackage -online"

ECHO Removing Autodesk
PowerShell -Command "Get-AppxPackage -AllUsers *Autodesk* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Autodesk*'} | remove-appxprovisionedpackage -online"

ECHO Removing Microsoft News
PowerShell -Command "Get-AppxPackage -AllUsers *News* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*News*'} | remove-appxprovisionedpackage -online"

ECHO Removing Disney Magic Kingdoms
PowerShell -Command "Get-AppxPackage -AllUsers *Disney* | Remove-AppxPackage"
PowerShell -Command "Get-appxprovisionedpackage -online | where-object {$_.packagename -like '*Disney*'} | remove-appxprovisionedpackage -online"



REM wmic product get name
ECHO This will attempt to remove additional unnecessary software.
ECHO You may see the message No Instance(s) Available. 
ECHO This will take about 5 to 10 minutes depending on the speed of the PC.

REM Dell Digital Delivery
wmic product where name="Dell Digital Delivery" call uninstall /nointeractive

REM Dell Mobile Connect Drivers
wmic product where name="Dell Mobile Connect Drivers" call uninstall /nointeractive

REM Dell SupportAssist ... not found?
wmic product where name="Dell SupportAssist" call uninstall /nointeractive

REM Dell SupportAssist Remediation
wmic product where name="Dell SupportAssist Remediation" call uninstall /nointeractive

REM Dell SupportAssistAgent
wmic product where name="Dell SupportAssistAgent" call uninstall /nointeractive

REM Dell Update
wmic product where name="Dell Update" call uninstall /nointeractive

REM Dell Update - SupportAssist Update Plugin
wmic product where name="Dell Update - SupportAssist Update Plugin" call uninstall /nointeractive

REM OTHER
wmic product where name="Dell Customer Connect" call uninstall /nointeractive
wmic product where name="Dell Foundation Services" call uninstall /nointeractive
wmic product where name="Dell Help & Support" call uninstall /nointeractive
wmic product where name="Dell Product Registration" call uninstall /nointeractive
wmic product where name="Dropbox 20 GB" call uninstall /nointeractive
wmic product where name="*PROSet/Wireless*" call uninstall /nointeractive
wmic product where name="McAfee LiveSafe" call uninstall /nointeractive

REM Error with spacing?
REM wmic product where name="*Office Home*" call uninstall /nointeractive

REM McAfee Security ... not found?
wmic product where name="McAfee Security" call uninstall /nointeractive
REM The "Uninstall" entry in the registry doesn't have a PowerShell/MSI-friendly GUID. It is, instead, 
"C:\Program Files\McAfee\MSC\mcuihost.exe /body:misp://MSCJsRes.dll::uninstall.html /id:uninstall"

ECHO Launching Add/Remove Programs...
appwiz.cpl

REM https://stackoverflow.com/questions/20861432/batch-file-to-uninstall-a-program

GOTO End_Routine


REM map server \\rams.adp.vcu.edu\soe\itc to S:\
:Map_Rams_Server
REM There's an issue when an elevated (Administrator) CMD Prompt mounts a network drive where it only mounts it for the Administrator.
REM The command below will modify the registry to mirror any network drives that the Administrator mounts to the current logged in user.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLinkedConnections" /t REG_DWORD /d 1 /f
REM maybe change this back to default upon exit?

REM net use S: \\rams.adp.vcu.edu\soe\itc password /user:rams\Username
REM to remove all mapped drives type:   
REM net use S: /d
start cmd.exe /c net use s: \\rams.adp.vcu.edu\soe\itc\its /persistent:no

REM Set Source and Target for each App on the server

GOTO Create_Source_Target_Variables

REM REM BELOW IS UNREACHABLE
REM SET "Source=S:\Software\Standard Software"
REM SET "Target=%UserProfile%\Desktop\TEMP"

REM SET "SophosSource=%Source%\Sophos\Win"
REM SET "SophosTarget=%Target%\Sophos"

REM SET "TeamViewerSource=%Source%\TeamViewer 9\Win"
REM SET "TeamViewerTarget=%Target%\TeamViewer"

REM SET "NiniteSource=%Source%\Ninite"
REM SET "NiniteTarget=%Target%\Ninite"

REM SET "MSOfficeSource=%Source%\MS Office 2016\Win\SW_DVD5_Office_Professional_Plus_2016_64Bit_English_MLF_X20-42432"
REM SET "MSOfficeTarget=%Target%\MS Office"

REM SET "LANDeskSource=%Source%\LANDesk Agents\Win"
REM REM Client-SOE_20163_with_status.exe
REM SET "LANDeskTarget=%Target%\LANDesk"

REM SET "SPSSSource=%Source%\SPSS\SPSS 25\Win"
REM SET "SPSSTarget=%Target%\SPSS"

REM SET "DDPESource=%Source%\DDPE\Win\DDPE_8.18"
REM SET "DDPETarget=%Target%\DDPE"

REM SET "SPSSSource=%Source%\SPSS\SPSS 25\Win"
REM SET "SPSSTarget=%Target%\SPSS"




REM install Sophos
:Install_Sophos
REM Copy from Server to %userprofile%\desktop\TEMP
REM start \desktop\TEMP\Sophos
ECHO NEW Copying Sophos Installer from Server to Desktop
robocopy "%SophosSource%" "%SophosTarget%" SophosAV_TSA.exe

REM set date back for old Sophos Installer
REM date 05/20/2018

ECHO Launching Sophos Installer
cd %SophosTarget%
start /wait SophosAV_TSA.exe /S
REM --quiet Runs the installer without displaying the UI

REM Sync Date back if on domain
REM net time /domain

REM Sync date back if not joined to domain
REM net start w32time 
REM if you get an error use the above
REM w32tm /resync

GOTO End_Routine
REM wait until Sophos install complete


:Install_TeamViewer
ECHO Copying TeamViewer 9 from the Server to the Desktop\TEMP folder
robocopy "%TeamViewerSource%" "%TeamViewerTarget%" TeamViewer_Setup.exe

ECHO Running TeamViewer_Setup.exe with Silent Install
cd %TeamViewerTarget%
start /wait TeamViewer_Setup.exe /S /norestart
REM "%TeamViewerTarget%\TeamViewer_Setup.exe"

GOTO End_Routine

REM install MS Office 2013 64 bit
:Install_MS_Office
ECHO Copying MS Office Installer from Server to Desktop
robocopy "%MSOfficeSource%" "%MSOfficeTarget%" /E

ECHO Launching MS Office 2016 Silent Installer
cd %MSOfficeTarget%
REM setup.exe /adminfile MSOffice2016SilentInstall.msp
start /wait setup.exe /adminfile MSOffice2016SilentInstall.MSP

REM ECHO Launching MS Office Installer
REM "%MSOfficeTarget%\setup.exe"


:Fix_MS_Office_2016
REM This should fix the error that occurs when a user installs a volume license
REM version of MS Office before they uninstalled the pre-installed version of 
REM Office on the PC.
REM Source: https://support.office.com/en-us/article/office-repeatedly-prompts-you-to-activate-on-a-new-pc-a9a6b05f-f6ce-4d1f-8d49-eb5007b64ba1

REM <KeyName> 
REM Specifies the full path of the subkey. The export operation works only with the local computer. The KeyName must include a valid root key. 
REM Valid root keys are: HKLM, HKCU, HKCR, HKU, and HKCC.

REM <FileName>
REM Specifies the name and path of the file to be created during the operation. 
REM The file must have a .reg extension.

REM Overwrites any existing file with the name FileName without prompting for confirmation.

REM Example: reg export HKLM\Software\MyCo\MyApp AppBkUp.reg
REM Syntax: reg export KeyName FileName [/y] [/f]

REM Exporting the registry file before deletion.
ECHO Exporting the registry keys before backup.
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Office\16.0\Common\OEM" OfficeBackUp1.reg /y
reg export "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\16.0\Common\OEM" OfficeBackup2.reg /y

ECHO Deleting the registry keys.
REM Syntax for Deleting: reg delete  Registry_key_path /v Registry_value_name
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Office\16.0\Common\OEM" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\16.0\Common\OEM" /f

ECHO Complete. Opening Microsoft Word...  ensure the issue is resolved and that Office is activated.
start winword

GOTO End_Routine


REM run 08 Ninite
:Install_Ninite
REM .NET 4.7 requires Win 10 Anniversary or later
ECHO Copying Ninite Installer from Server to Desktop
robocopy "%NiniteSource%" "%NiniteTarget%" "Ninite.exe"

ECHO Launching Ninite Installer
"%NiniteTarget%\Ninite.exe"

GOTO End_Routine


REM Download and Install Adobe Reader… launch website
:Install_Adobe_reader
ECHO Launching Adobe Reader Installer
PowerShell -command "Get-Packageprovider Chocolatey"; "Install-Package -Name AdobeReader -force -verbose";

REM website
REM make adobe reader default PDF
REM start chrome.exe "https://get.adobe.com/reader/"
REM start ms-settings:defaultapps

GOTO End_Routine

REM Config Firefox, install adblock plus and english filter subs
:Configure_Firefox
ECHO Launching Firefox
start firefox.exe "https://eyeo.to/adblockplus/firefox_install" "https://get.adobe.com/flashplayer/download/?installer=FP_30_for_Firefox_-_NPAPI&os=Windows%2010&browser_type=Gecko&browser_dist=Firefox&dualoffer=false&mdualoffer=true&stype=7612&d=McAfee_Security_Scan_Plus&d=McAfee_Safe_Connect"


GOTO End_Routine
 


REM remove pre-loaded toolbars (Google, Ask, etc)

REM Install Chrome
:Install_Chrome
REM taken care of by ninite
REM start microsoft-edge: https://www.google.com/chrome/?system=true&standalone=1&platform=win64
REM start https://www.google.com/chrome/?system=true&standalone=1&platform=win64


REM Config Google Chrome
:Configure_Chrome
PowerShell -command "Install-Package -name AdblockPlusChrome -force -verbose" 

ECHO Launching Chrome
start chrome.exe "https://chrome.google.com/webstore/detail/cfhdojbkjhnklbpkdaibdccddilifddb"
REM start ms-settings:defaultapps

GOTO End_Routine



REM Install latest Java from Oracle’s website
REM DEPRECATED, Ninite takes care of 32-bit and 64-bit Java
:Install_Java
REM https://www.java.com/en/download
ECHO Launching java.com/en/download
start chrome https://www.java.com/en/download
start chrome http://javadl.oracle.com/webapps/download/AutoDL?BundleId=233141_512cd62ec5174c3487ac17c61aaa89e8

GOTO End_Routine



REM Cisco AnyConnect VPN .exe or ramsvpn.vcu.edu
:Install_Cisco_VPN
ECHO Launching RamsVPN.VCU.EDU for Cisco AnyConnect VPN Installer from Server to Desktop
REM start http://ramsvpn.vcu.edu
robocopy "%RamsVPNSource%" "%RamsVPNTarget%" anyconnect-win-4.4.03034-core-vpn-predeploy-k9.msi

ECHO Launching Cisco AnyConnect VPN Installer
cd %RamsVPNTarget%
start /wait msiexec /i anyconnect-win-4.4.03034-core-vpn-predeploy-k9.msi /quiet /qn
REM /qn
REM "%RamsVPNTarget%\anyconnect-win-4.4.03034-core-vpn-webdeploy-k9.msi"

REM CONSIDER VPN MSI file for SILENT install

ECHO Type ramsvpn.vcu.edu into the Cicsco AnyConnect VPN and connect.
ECHO Do NOT type your credentials. Just cancel when it prompts you.
ECHO You must exit out of Cisco AnyConnect VPN to continue (it minimized to the tray)

ECHO Launching VPNUI.exe
"C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe"


GOTO End_Routine


REM use ramsvpn.vcu.edu and connect


REM delete all folders copied to desktop, empty recycle bin(s)
:Delete_Desktop_Temp_Files
ECHO Deleting TEMP files on Desktop
RD /S "%UserProfile%\Desktop\temp"

GOTO End_Routine


REM Mobile Device? Y/N
:Install_DDPE
ECHO Copying DDPE from Server to Desktop
REM S:\New Computer Setup Standard SW\DDPE\Windows\DDPE_8.18
robocopy "%DDPESource%" "%DDPETarget%" DDPE_64bit_setup.exe
robocopy "%DDPESource%" "%DDPETarget%" ddpeInstall.bat

ECHO Launching DDPE_Installer
cmd.exe /c "%DDPETarget%\ddpeInstall.bat"

REM Ensure .NET 4.7 is installed
REM Ensure Windows Feature Update is installed
rem copy/paste bat code

GOTO End_Routine



REM Log out of Admin account and into SOE Admin
:Switch_User
ECHO Switching to SOE Admin
tsdiscon.exe /v

GOTO End_Routine 


:Disable_Administrator
REM net user administrator /active:no
net user administrator /active:no

GOTO End_Routine



REM Ready to Add to Domain? Y/N
:Join_Rams_Domain
ECHO Joining Rams Domain
REM wmic.exe /interactive:off ComputerSystem Where name="%computername%" call JoinDomainOrWorkgroup FJoinOptions=3 Name="myDom.local" UserName="myDom\UsrName" Password="@passwrd!@" AccountOU="OU=MyClients;OU=MyOrg;DC=myDom;DC=local"
wmic.exe /interactive:on ComputerSystem Where name="%computername%" call JoinDomainOrWorkgroup FJoinOptions=3 Name="rams" AccountOU="OU=MyClients;OU=MyOrg;DC=rams"
REM account (2). If the computer account would have been in Active Directory already then you should use FJoinOptions = 1
REM https://msdn.microsoft.com/en-us/library/windows/desktop/aa392154(v=vs.85).aspx
REM VBS alternative: https://social.technet.microsoft.com/Forums/scriptcenter/en-US/d4901973-501d-4685-8e18-ddbb4d2ba450/join-domain-script?forum=ITCG
GOTO End_Routine



REM Install LANDesk Client with Status
:Install_LANDesk
ECHO Copying LANDesk Client with Status to Desktop
robocopy "%LANDeskSource%" "%LANDeskTarget%" Client-SOE_20163_with_status.exe

ECHO Installing LANDesk Client with Status... This will take 15 - 30 minutes. It will appear as though nothing is happening. Please wait!
"%userprofile%\desktop\temp\LANDesk\Client-SOE_20163_with_status.exe"

GOTO End_Routine



:Install_SPSS
robocopy "%SPSSSource%" "%SPSSTarget%" "IBM SPSS Statistics 25.msi"
REM robocopy "%SPSSSource%" "%SPSSTarget%" "SPSS 25 license through JUNE 2018.txt"

REM "%SPSSSource%\SPSS 25 license through JUNE 2018.txt"
REM "%SPSSSource%\SPSS_Statistics_25_win64.exe"

cd %SPSSTarget%
start /wait msiexec /i "IBM SPSS Statistics 25.msi" /quiet /qn
GOTO SPSS_License


:SPSS_License
REM SPSS 25 or 24 Licensing Update

SET "SPSS25=c:\program files\ibm\spss\statistics\25\"
SET "SPSS24=c:\program files\ibm\spss\statistics\24\"

REM echo %SPSS25%
REM echo %SPSS24%

IF EXIST "%SPSS25%" (
Echo Registering New License for SPSS 25
    cd %SPSS25%
    licenseactivator.exe 564299dc60f21283766a
) ELSE (
	Echo SPSS 25 not found.
	IF EXIST "%SPSS24%" (
	    Echo Registering New License for SPSS 24
            cd %SPSS24%
            licenseactivator.exe d2635ef664db16425428
	) ELSE (
	    Echo SPSS 24 not found.
	)
)

GOTO End_Routine





REM Update LANDesk Ticket… launch servicedesk.vcu.edu
:Update_LANDesk_Ticket
ECHO Include detailednotes and updates
ECHO Notify User
ECHO Verify that all work is complete with the computer.
ECHO Use LANDesk note to Email the user that the work is complete and they may retrieve their device.
ECHO Once the user has picked up their device update the ticket of who retrieved it and at what time.
ECHO Close the ticket.

start chrome http://servicedesk.vcu.edu

GOTO End_Routine



:Windows_Updates
wuauclt.exe /detectnow /updatenow
start ms-settings:windowsupdate

GOTO End_Routine


REM PRINTER INSTALLATION
REM Remove any Auto-Detected/Installed Printers that the user shouldn’t have access to.
REM Refer to IP Address Sheet: https://docs.google.com/spreadsheets/d/1t3PQtZxicByiNLvgFb2E4ra59pojhjwr3pFKgCp1kIA/edit#gid=13

REM set up seppage.sep
REM Local Printers? Y/N 
REM Seaboard? Y/N
:Install_Ricoh8001
cls
Echo   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ECHO   @@                                                                      @@
Echo   @@                       FOR VCU 4th Floor Professors ONLY              @@ 
ECHO   @@                                                                      @@
ECHO   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                  This will load the Ricoh 8001 copier drivers onto a
ECHO                          Windows 10 Machine.
ECHO.
ECHO                           Continue to load the drivers, 
ECHO                or close this window if you DO NOT want to proceed.
ECHO. 
ECHO.
ECHO.
ECHO.

pause

ECHO.
ECHO.
ECHO.
ECHO.
ECHO                    On Windows 10, a seperate "Activiation box"
ECHO                                  may pop up.
ECHO.
ECHO                          You have to say "ok" on that  
ECHO                 activation box to allow this script to proceed.
ECHO. 
ECHO.
ECHO      (If this box seems like its just sitting there not doing anything...
ECHO            look for the seperate activation box and choose "ok")
ECHO.
ECHO.
ECHO.
ECHO.
pause

REM SET PRNPORT PATH
set prnport=c:\windows\system32\Printing_Admin_Scripts\en-US\

REM *********************************************************
REM wfirst = first octet, second = second octet
REM *********************************************************
set wfirst=172
set second=22
REM *********************************************************
REM RIGGED FOR THIS VCU ONLY
REM *********************************************************

REM ***********************************************
REM SKIPPING THE OLD PRINTER DELETES FOR NOW
REM ************************************************
GOTO VCU4FRicoh8001

:DEL_EXIST
REM DELETE EXISTING COPIERS
rundll32 printui.dll,PrintUIEntry /dl /n "RICOH Aficio MP 7001 PCL 5e" /q
rundll32 printui.dll,PrintUIEntry /dl /n "RICOH Aficio MP 7500 PCL 5e" /q

rundll32 printui.dll,PrintUIEntry /dl /n "PCL6 Driver for Universal Print" /q

REM Wild Card * doesn't work. rundll32 printui.dll,PrintUIEntry /dl /n "*Ricoh*" /q


REM *************
REM 4th Floor Ricoh 8001
REM *************

:VCU4FRicoh8001
REM Copy Printer Drivers from Server
SET "Ricoh8001Source=S:\Drivers\Printer Drivers\Ricoh Printer Drivers\Ricoh 8001 Rm 4065-B (ip172.22.213.131)\Windows 10 64-bit"
SET "Ricoh8001Target=%Target%\Ricoh8001"
robocopy "%Ricoh8001Source%" "%Ricoh8001Target%" /E

set printer="Rm 4092 - Ricoh MP 8001"
set printdriver="RICOH Aficio MP 8001 PCL 6"
SET PDPATH="%Ricoh8001Target%\r67293en\disk1\oemsetup.inf"

goto VCU4FRicoh8001-NOTWIN-BETA


:VCU4FRicoh8001-NOTWIN-BETA
REM ADD IP PORT
ECHO.
REM set /p xxx=Enter Last Two Octets of Printer IP (with a period in between): %wfirst%.%second%.
set xxx=213.131
REM WHAT???
cscript %prnport%\prnport.vbs -a -r IP_%wfirst%.%second%.%xxx%  -h %wfirst%.%second%.%xxx%  -o raw -n 9100 -me -i 1 -y public

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO PLEASE WAIT WHILE DRIVERS ARE LOADED TO YOUR SYSTEM...
ECHO THIS BOX WILL CLOSE BY ITSELF WHEN DONE
SET PIP=%wfirst%.%second%.%xxx%

rem - add printer not already in windows
rundll32 printui.dll,PrintUIEntry /if /b %printer% /f %PDPATH%  /r IP_%PIP% /m %printdriver%
rem control printers

REM Need to test if this works for all Ricohs installed or the first one found
:Set_Separator_Page
REM Copy the Sep Page
SET "SepPageSource=S:\Drivers\Printer Drivers"
SET "SepPageTarget=c:\windows\System32"

robocopy "%SepPageSource%" "%SepPageTarget%" PCLSeparatorPageJuly2018.sep
PowerShell -Command "Set-Printer -Name '*Ricoh*' -SeparatorPageFile 'c:\windows\system32\PCLSeparatorPageJuly2018.sep'"

GOTO End_Routine



:Install_Ricoh_4002
cls
Echo   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ECHO   @@                                                                      @@
Echo   @@                       FOR VCU Dean's Office ONLY                     @@ 
ECHO   @@                                                                      @@
ECHO   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
ECHO.
ECHO.
ECHO.
ECHO.
ECHO                  This will load the Ricoh 4002 copier drivers onto a
ECHO                          Windows 10 Machine.
ECHO.
ECHO                           Continue to load the drivers, 
ECHO                or close this window if you DO NOT want to proceed.
ECHO. 
ECHO.
ECHO.
ECHO.

pause

ECHO.
ECHO.
ECHO.
ECHO.
ECHO                    On Windows 10, a seperate "Activiation box"
ECHO                                  may pop up.
ECHO.
ECHO                          You have to say "ok" on that  
ECHO                 activation box to allow this script to proceed.
ECHO. 
ECHO.
ECHO      (If this box seems like its just sitting there not doing anything...
ECHO            look for the seperate activation box and choose "ok")
ECHO.
ECHO.
ECHO.
ECHO.
pause

REM SET PRNPORT PATH
set prnport=c:\windows\system32\Printing_Admin_Scripts\en-US\

REM *********************************************************
REM wfirst = first octet, second = second octet
REM *********************************************************
set wfirst=172
set second=22
REM *********************************************************
REM RIGGED FOR VCU ONLY
REM *********************************************************


REM ***********************************************
REM SKIPPING THE OLD PRINTER DELETES FOR NOW
REM ************************************************
GOTO VCURicoh4002


:DEL_EXIST
REM DELETE EXISTING LDHS COPIERS
rundll32 printui.dll,PrintUIEntry /dl /n "RICOH Pro 906EX PCL 6" /q
rundll32 printui.dll,PrintUIEntry /dl /n "RICOH Aficio MP 7001 PCL 5e" /q
rundll32 printui.dll,PrintUIEntry /dl /n "RICOH Aficio MP 7500 PCL 5e" /q


REM *************
REM 2nd Floor, Dean's Office Ricoh 4002
REM *************

:VCURicoh4002
REM Copy Printer Drivers from Server
SET "Ricoh4002Source=S:\Drivers\Printer Drivers\Ricoh Printer Drivers\Ricoh 4002 Rms 2090 & 1037 (ip172.22.212.129)\Win 10"
SET "Ricoh4002Target=%Target%\Ricoh4002"
robocopy "%Ricoh4002Source%" "%Ricoh4002Target%" /E

set printer="Rm 2090 - Ricoh MP 4002"
set printdriver="Gestetner MP 4002 PCL 6"
SET PDPATH="%Ricoh4002Target%\z74317L13\disk1\oemsetup.inf"

goto VCURicoh4002-NOTWIN-BETA


:VCURicoh4002-NOTWIN-BETA
REM ADD IP PORT
ECHO.
REM set /p xxx=Enter Last Two Octets of Printer IP (with a period in between): %wfirst%.%second%.
set xxx=212.129
REM WHAT???
cscript %prnport%\prnport.vbs -a -r IP_%wfirst%.%second%.%xxx%  -h %wfirst%.%second%.%xxx%  -o raw -n 9100 -me -i 1 -y public

ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO PLEASE WAIT WHILE DRIVERS ARE LOADED TO YOUR SYSTEM...
ECHO THIS BOX WILL CLOSE BY ITSELF WHEN DONE
SET PIP=%wfirst%.%second%.%xxx%

rem - add printer not already in windows
rundll32 printui.dll,PrintUIEntry /if /b %printer% /f %PDPATH%  /r IP_%PIP% /m %printdriver%
rem control printers

GOTO Set_Separator_Page



:END
exit
