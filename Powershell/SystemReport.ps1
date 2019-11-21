write-output 
gwmi -class win32_operatingsystem | format-list -Property PSComputerName,Version

gwmi -class win32_computersystem | format-list -property Description

gwmi -class win32_processor | format-list -property L2CacheSize,L3CacheSize,L3CacheSpeed

$totalcapacity = 0
get-wmiobject -class win32_physicalmemory |
foreach {
 new-object -TypeName psobject -Property @{
 Manufacturer = $_.manufacturer
 "Speed(MHz)" = $_.speed
 "Size(MB)" = $_.capacity/1mb
 Bank = $_.banklabel
 Slot = $_.devicelocator
 }
 $totalcapacity += $_.capacity/1mb
} |
ft  Manufacturer, "Size(MB)", "Speed(MHz)", Bank, Slot, Description
"Total RAM: ${totalcapacity}MB "

gwmi -class win32_diskdrive | fl -Property Manufacturer,Model,{$_.Size/1mb}
gwmi -class win32_logicaldisk |
foreach{
new-object -typename psobject -property @{
FreeSpace = $_.FreeSpace/1mb}
} | fl

gwmi -Class win32_videocontroller | fl -Property Description,VideoModeDescription