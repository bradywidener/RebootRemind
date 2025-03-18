#Removing Scheduled Task
Unregister-ScheduledTask -TaskName "RebootRemindCheck" -Confirm:$false

#Removing the program from program files
Remove-Item -Path "C:\Program Files\rebootremind" -Recurse -Force
