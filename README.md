# Wait-Net
Powershell cmdlet to wait for Internet connectivity to establish again.

# About
I wrote this cmdlet while the cafe I was sitting at lost its Internet connection. I wanted to be notified when the Internet's back. I usually use `ping -t *some_known_ip_address*` to do that, but I didn't remember any
well-known IP addresses at the time. I remember 8.8.8.8 and 1.1.1.1, but I'm not sure if they responded to pings. This cmdlet is just a better way to know if Internet's back.

I also thought that a simple PowerShell cmdlet would be idiomatic and useful for similar purposes in other people's scripts.

# Installation
`Install-Module Wait-Net`

# Cmdlets
## `Wait-Net`
Wait until Internet connectivity is restored on at least one of the network adapters on the system. It accepts a `-Milliseconds` parameter to specify the
delay for checks which is 1000 (1 Second) by default.

By default, Wait-Net shows no output. Feel free to use `-Debug` switch if you want to see what it's doing while waiting.

## `Test-NetConnectivity`
This cmdlet just returns `$true` or `$false` if there is Internet connectivity.

# License
MIT License. See LICENSE.md for details.
