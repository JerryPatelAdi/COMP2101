﻿Get-WmiObject Win32_NetworkAdapter |
 where-object adaptertype -match "ethernet" |
 Foreach-Object {
 $nac = $_.GetRelated("Win32_NetworkAdapterConfiguration");
 New-Object PSObject -Property @{name=$_.name;
 ipaddress=$nac.ipaddress |
 where-object {($_ -is [string]) -and ($_.indexof(".") -gt 0)};
 ipgateway=$nac.defaultipgateway |
 where-object {($_ -is [string]) -and ($_.indexof(".") -gt 0);
 }
 }
 } |
 format-table name, ipaddress, ipgateway -AutoSize