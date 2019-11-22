Write-Output "Operating System Info"
gwmi -class win32_operatingsystem | format-list -Property PSComputerName,Version
Write-Output "Computer System Info"
gwmi -class win32_computersystem | format-list -property Description
Write-Output "Windows Processor Info"
gwmi -class win32_processor | format-list -property L2CacheSize,L3CacheSize,L3CacheSpeed

Write-Output "Windows Physical Memory Info"
$totalcapacity = 0
get-wmiobject -class win32_physicalmemory |
foreach {
 new-object -TypeName psobject -Property @{
 "Size(MB)" = $_.capacity/1mb
 Bank = $_.banklabel
 Slot = $_.devicelocator
 }
 $totalcapacity += $_.capacity/1mb
} |
ft "Size(MB)", Bank, Slot
"Total RAM: ${totalcapacity}MB "

Write-Output "Disk Info"
gwmi -class win32_logicaldisk | foreach {$logdisk=$_
gwmi -class win32_diskpartition | foreach{
$more = $_.GetRelated("Win32_diskdrive")
New-Object PSObject -Property @{
Manufacturer=$more.Manufacturer
Model=$more.Model
"Size(GB)"=$more.Size/1gb -as [int]
"FreeSpace(GB)"=$more.FreeSpace/1gb -as [int]
}}} | ft -property Manufacturer,Model, "Size(GB)","FreeSpace(GB)"

Write-Output "Video Info"
get-ciminstance -Class cim_videocontroller | fl -Property Description,CurrentHorizontalResolution,CurrentVerticalResolution