# No-IP-DNSdynamic-update---Mikrotik-RouterOS
Implementation of a Script to renew the dynamic IP of your Router to a NOIP address


This is a new script, which is running in last versión

**************************************************************

System/Script/Add

Name:"Update_NOIP" or anyone you want

Policy: check

-Don´t Require Permissions

-read

-write

-test

***************************************************************


System/Scheduler/Add

Name: Any you want

Start Date: "Oct/30/2020" for example

Start Time: "00:00:00" for example

Interval:"00:00:10" or anyone you want

Policy: check

-read

-write

-test

On Event:"Update_NOIP" or the name you put the script

***************************************************************
