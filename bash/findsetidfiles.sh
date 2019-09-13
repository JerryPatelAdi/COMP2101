#!/bin/bash
#SetUid Files:::::
daemon -rwsr-sr-x /usr/bin/at
root -rwsr-sr-x /usr/lib/snapd/snap-confine
root -rwsr-xr-x /bin/fusermount
root -rwsr-xr-x /bin/mount
root -rwsr-xr-x /bin/ping
root -rwsr-xr-x /bin/su
