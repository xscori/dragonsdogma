# dragonsdogma
Backup Dragon's Dogma: Dark Arisen SAVE files

This is a PowerShell script I used to backup my Dragon's Dogma: Arisen Save files.

Game only allows one save file, there are no additional slots. This scripts creates an auto-backup of save file.
Every time a 'save' event happens in game, whether it is the game auto-saving or I manually save, save file is copied to backup folder with a timestamp.

It's then possible to go back to a specific save by simply overwriting the current save file with any backed up save file.

To call the powershell script, a simple cmd file would do and can launched from anywhere.
The easiest way for me to change Steam's launcher to call this cmd file.
If powershell script is downloaded and saved as c:\temp\ddda_backup.ps1

Steam > Dragon's Dogma Dark Arisen > Manage (Gear Icon ) > Properties > Launch Options
Powershell -noexit -file c:\temp\ddda_backup.ps1

After this change, when I click on play button in Steam for DDDA, it launched the script.
In turn script creates a process that "watches" save folder location and handles backing it up.
