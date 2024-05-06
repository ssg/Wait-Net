#requires -Version 7.0

function Wait-Net {
    [CmdletBinding()]
    param (
        [int]$Milliseconds = 1000
    )
    process {
        $connected = $false
        while (!$connected) {
            Write-Debug "Checking for connectivity"
            $connectedProfiles = Get-NetConnectionProfile 
            | Where-Object { $_.IPv4Connectivity -eq "Internet" -or $_.IPv6Connectivity -eq "Internet" }
            | Select-Object -ExpandProperty InterfaceAlias
            if ($connectedProfiles.Count -gt 0) {
                $connected = $true
                Write-Debug "Connected to Internet over $($connectedProfiles -join ', ')"
            }
            else {
                Write-Debug "Sleeping for $Milliseconds"
                Start-Sleep -Milliseconds $Milliseconds
            }
        }
    }
}

function Test-NetConnectivity {
    [CmdletBinding()]
    $tmp = Get-NetConnectionProfile 
        | Where-Object { $_.IPv4Connectivity -eq "Internet" -or $_.IPv6Connectivity -eq "Internet" }
    return $tmp.Count -gt 0
}

Export-ModuleMember -Function Wait-Net,Test-NetConnectivity