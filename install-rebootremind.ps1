#Copying folder over to Program Files
Copy-Item -Path ".\rebootremind" -Destination "C:\Program Files" -Recurse

#Creating Scheduled Task to kick off this program once every 12 hours
$Action = New-ScheduledTaskAction -Execute "C:\Program Files\rebootremind\rebootremind.exe"
$Trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddMinutes(1) -RepetitionInterval (New-TimeSpan -Hours 4)
$Principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive
$Description = "Checks to see if you need a reboot. If so, it will create a toast notification to remind you."
Register-ScheduledTask -TaskName "RebootRemindCheck" -Action $Action -Trigger $Trigger -Principal $Principal -Description $Description
