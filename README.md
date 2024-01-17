# Dragon's Dogma: Dark Arisen Save File Backup
Backup Dragon's Dogma: Dark Arisen SAVE files

This is a PowerShell script I used to backup my Dragon's Dogma: Arisen Save files.

Game only allows one save file, there are no additional slots. This scripts creates an auto-backup of save file.
Every time a 'save' event happens in game, whether it is the game auto-saving or I manually save, save file is copied to backup folder with a timestamp.

It's then possible to go back to a specific save by simply overwriting the current save file with any backed up save file.

To call the powershell script, a simple cmd file would do and can launched from anywhere.
The easiest way for me to change Steam's launcher to call this cmd file.
If you download both .cmd and .ps1 files and put them in c:\temp\

Steam > Dragon's Dogma Dark Arisen > Manage (Gear Icon ) > Properties > Launch Options
Powershell -noexit -file c:\temp\ddda_backup.cmd

After this change, if you click on play button in Steam for DDDA, it launches the command line script.
Then, PowerShell script 
- registers an event watcher
- launches the game
- watches the save folder location and handles backing it up.

You will need to edit files to point them to your own Steam Save file, your own game startup folder.  
