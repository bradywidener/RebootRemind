#Copying folder over to Program Files
Copy-Item -Path ".\rebootremind" -Destination "C:\Program Files" -Recurse

#Creating Scheduled Task to kick off this program once every 4 hours
Register-ScheduledTask -Xml (get-content '.\RebootRemind.xml' | out-string) -TaskName "RebootRemindCheck" -Force
