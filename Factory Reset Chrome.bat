@ECHO OFF

REM Tutorial: http://www.tenforums.com/tutorials/71526-firefox-completely-reset-default-windows.html

ECHO This will reset all Chrome, Firefox, and Edge Broswing Data.
ECHO This will delete all Desktop, Documents, Downloads, Favorites, Music, OneDrive, Pictures, and Videos
ECHO It will also Forget the VCU SafeNet Wireless credentials and Empty the Recycle Bin for All User Accounts

ECHO Close this if you do not wish to process, otherwise press any key to continue.
PAUSE

ECHO Factory Resetting Google Chrome
RD /S /Q "%LocalAppData%\Google\Chrome"
ECHO Complete!

ECHO Resetting All Firefox Data
RD /S /Q "%LocalAppData%\Mozilla\Firefox\"
RD /S /Q "%AppData%\Mozilla"
ECHO Complete

ECHO Factory Resetting Edge
RD /S /Q "%UserProfile%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
ECHO Complete!

ECHO Deleting Files in Downloads, Documents, Pictures, Videos, Music, and Desktop for %UserProfile%
REM /F  Ignore read-only setting and delete anyway (FORCE) 
REM /S  Delete from all Subfolders (DELTREE)
REM /Q  Quiet mode, do not give a Yes/No Prompt before deleting.
DEL /F /Q /S "%UserProfile%\Downloads\*.*"
DEL /F /Q /S "%UserProfile%\Documents\*.*"
DEL /F /Q /S "%UserProfile%\Pictures\*.*"
DEL /F /Q /S "%UserProfile%\Videos\*.*"
DEL /F /Q /S "%UserProfile%\Music\*.*"

ECHO Deleting Desktop Folders
DEL /F /Q "c:\users\soe user\Desktop\*"
FOR /D %%p IN ("C:\users\soe user\Desktop\*.*") DO RD "%%p" /S /Q
ECHO Complete

ECHO Cleaning Up Documents
DEL /Q "c:\users\soe user\Documents\*"
FOR /D %%p IN ("C:\users\soe user\Documents\*.*") DO RD "%%p" /S /Q
ECHO Complete

ECHO Cleaning Up Downloads
DEL /Q "c:\users\soe user\Downloads\*"
FOR /D %%p IN ("C:\users\soe user\Downloads\*.*") DO RD "%%p" /S /Q
ECHO Complete

ECHO Cleaning Up Favorites
DEL /Q "c:\users\soe user\Favorites\*"
FOR /D %%p IN ("C:\users\soe user\Favorites\*.*") DO RD "%%p" /S /Q
ECHO Complete

ECHO Cleaning Up Music
DEL /Q "c:\users\soe user\Music\*"
FOR /D %%p IN ("C:\users\soe user\Music\*.*") DO RD "%%p" /S /Q
ECHO Complete

ECHO Cleaning Up One Drive
DEL /Q "c:\users\soe user\OneDrive\*"
FOR /D %%p IN ("C:\users\soe user\OneDrive\*.*") DO RD "%%p" /S /Q
ECHO Complete

ECHO Cleaning Up Pictures
DEL /Q "c:\users\soe user\Pictures\*"
FOR /D %%p IN ("C:\users\soe user\Pictures\*.*") DO RD "%%p" /S /Q
ECHO Complete

ECHO Cleaning Up Videos
DEL /Q "c:\users\soe user\Videos\*"
FOR /D %%p IN ("C:\users\soe user\Videos\*.*") DO RD "%%p" /S /Q
ECHO Complete

ECHO Forgetting VCU SafeNet Wireless
netsh wlan delete profile name="VCU SafeNet Wireless"
ECHO Complete


ECHO Emptying Recycle Bins
RD /S /Q "c:\$Recycle.Bin"
ECHO Complete!

PAUSE
