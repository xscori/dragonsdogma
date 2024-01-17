# delete existing watcher events
Get-EventSubscriber -force | unregister-event -force

# start ddda if it is not already running
if (-not (get-process ddda)) {
		"launching dda"
		# note this is where I have the game executable, change it for your installation
		start-process G:\games\steam\steamapps\common\DDDA\dda.exe
}

# setup watcher
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = 'C:\Program Files (x86)\Steam\userdata\342408821\367500\remote'
$watcher.EnableRaisingEvents = $true

$action =
    {
		$path = $event.SourceEventArgs.FullPath
		$changetype = $event.SourceEventArgs.ChangeType
		Write-Host "$path was $changetype at $(get-date)"
		
		# number after userdata is different for each user, find your .sav file and replace the line
		$dd_save_file = "C:\Program Files (x86)\Steam\userdata\342408821\367500\Remote\DDDA.sav"

		# when was it last saved
		$dd_save_file_date = (gci $dd_save_file).LastWriteTime

		# put the backup folder next to "Remote" folder
		$dd_backup_folder="C:\Program Files (x86)\Steam\userdata\342408821\367500\Backup"

		# find the latest backed up save file & its date
		$last_backup = (gci "C:\Program Files (x86)\Steam\userdata\342408821\367500\Backup" |Sort-Object LastWriteTime)[-1]
		$last_backup_date = $last_backup.LastWriteTime

		if ($dd_save_file_date -ne $last_backup_date) {
		Write-Output "Current save file has a newer date than last backed up file. Backing up..."

		$date = get-date -f "yyyy-MM-ddTHHmmss"
		copy-item $dd_save_file "$dd_backup_folder\${date}_DDDA.sav"

		} else {
		Write-Output "Have the latest save file backed up already"
		}
    }


# Register-ObjectEvent $watcher 'Created' -Action $action
$registered_event = Register-ObjectEvent $watcher 'Changed' -Action $action
write-output "Registered: $registered_event"
get-EventSubscriber
