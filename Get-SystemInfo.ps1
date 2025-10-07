<#
.SYNOPSIS
    A simple PowerShell script to gather and display basic system information.

.DESCRIPTION
    This script collects the computer name, primary IPv4 address, Windows version,
    OS installation date, and system uptime. It then displays this information
    in a clean, readable list format.

.AUTHOR
    Your Name / Your Website
.VERSION
    1.0
.DATE
    2025-10-07
#>

[PSCustomObject]@{
    "ComputerName"      = $env:COMPUTERNAME
    "IPAddress"         = (Get-NetIPAddress -AddressFamily IPv4 -AddressState Preferred -ErrorAction SilentlyContinue | Select-Object -First 1).IPAddress
    "WindowsVersion"    = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ProductName
    "InstallDate"       = (Get-Date "1970-01-01").AddSeconds((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").InstallDate)
    "Uptime"            = (New-TimeSpan -Start (Get-CimInstance Win32_OperatingSystem).LastBootUpTime)
} | Format-List
