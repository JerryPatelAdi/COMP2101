﻿get-wmiobject -class win32_logicaldisk | Where-Object -Property Size -ne "0" | Format-Table DeviceID,@{n="Size(MB)"; e={$_.Size/1mb -as [int]}},@{n="Free(MB)"; e={$_.freespace/1mb -as [int]}},ProviderName