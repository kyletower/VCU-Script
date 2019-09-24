@ECHO OFF
ECHO Factory Resetting Google Chrome
RD /S /Q "%LocalAppData%\Google\Chrome"
ECHO Complete!

ECHO Factory Resetting Edge
RD /S /Q "%UserProfile%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
ECHO Complete!

ECHO Emptying Recycle Bins
RD /S /Q "c:\$Recycle.Bin"
ECHO Complete!

ECHO Deleting Downloads, Documents, Pictures, Videos, Music, Desktop
DEL /F /Q /S "%UserProfile%\Downloads\*.*"
DEL /F /Q /S "%UserProfile%\Documents\*.*"
DEL /F /Q /S "%UserProfile%\Pictures\*.*"
DEL /F /Q /S "%UserProfile%\Videos\*.*"
DEL /F /Q /S "%UserProfile%\Music\*.*"
DEL /F /Q /S "%UserProfile%\Desktop\*.gm81"
DEL /F /Q /S "%UserProfile%\Desktop\*.gb1"

PAUSE
