@echo off
REM Windows 10 KMS Activation Script by Kyle Tower
REM Source 1: https://docs.microsoft.com/en-us/windows/deployment/volume-activation/activate-using-key-management-service-vamt
REM Source 2: https://docs.microsoft.com/en-us/windows-server/get-started/kmsclientkeys
REM Win 10 Pro, W269N-WFGWX-YVC9B-4J6C9-T83GX
REM Win 10 Edu, 6TP4R-GNPTD-KYYHQ-7B7DP-J447Y

goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
        echo ######## ########  ########   #######  ########  
        echo ##       ##     ## ##     ## ##     ## ##     ## 
        echo ##       ##     ## ##     ## ##     ## ##     ## 
        echo ######   ########  ########  ##     ## ########  
        echo ##       ##   ##   ##   ##   ##     ## ##   ##   
        echo ##       ##    ##  ##    ##  ##     ## ##    ##  
        echo ######## ##     ## ##     ##  #######  ##     ## 
        echo.
        echo.
        echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########
        echo This script must be run as administrator to work properly!  
        echo If you're seeing this after clicking on a start menu icon, then right click on the shortcut and select "Run As Administrator".
        echo ##########################################################
        echo.
        PAUSE
        PING 127.0.0.1 > NUL 2>&1
        EXIT /B 1
    )

    pause >nul
    
ECHO This will attempt to activate your Windows 10 Pro via KMS.
ECHO Open an elevated command prompt.
ECHO Installing a KMS Key
slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
ECHO Activating Online
slmgr.vbs /ato
ECHO To activate by using the telephone, type slui.exe 4.
ECHO After activating the KMS key, restart the Software Protection Service.
PAUSE
