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