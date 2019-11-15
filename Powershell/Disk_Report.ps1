﻿get-wmiobject -class win32_logicaldisk | Where-Object -Property Size -ne "0" | Format-Table DeviceID,{$_.Size/1mb},{$_.FreeSpace/1mb},ProviderName