# VCU-Script
This script will automate most of the process for standard PC setups.

Need to add Zoom to standard software install.
Need to clean up menu.

Source: https://support.zoom.us/hc/en-us/articles/201362163-Mass-Installation-and-Configuration-for-Windows#activedirectory

msiexec /i ZoomInstallerFull.msi /quiet /qn /norestart /log install.log ZoomAutoUpdate="true" ZSSOHOST="vcu.zoom.us" ZConfig="nogoogle=1;nofacebook=1;login_domain=vcu.edu;AddFWException=1;kCmdParam_InstallOption=8"
