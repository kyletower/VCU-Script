@ECHO OFF
ECHO Factory Resetting Google Chrome
RD /S /Q "%LocalAppData%\Google\Chrome"
ECHO Complete!

ECHO Factory Resetting Edge
RD /S /Q "%UserProfile%\AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
ECHO Complete!

PAUSE
