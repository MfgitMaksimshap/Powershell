<#
.SYNOPSIS
    Scans user profiles to determine the last time each user was active on the system.

.DESCRIPTION
    This script lists directories in C:\Users, filters out system and public profiles,
    and then checks the last modification time of each user's NTUSER.DAT file.
    The NTUSER.DAT file's LastWriteTime is a reliable indicator of the end of the user's last session.
    The output is a sorted table showing the most recently active users first.

.AUTHOR
    Your Name / Your Website
.VERSION
    1.0
.DATE
    2025-10-07
#>

Get-ChildItem -Path C:\Users -Force -Directory | 
    Where-Object { $_.Name -notin "Public", "Default", "Default User" } | 
    Select-Object @{Name="User"; Expression={$_.Name}}, @{Name="LastActivity"; Expression={(Get-Item "$($_.FullName)\NTUSER.DAT" -Force -ErrorAction SilentlyContinue).LastWriteTime}} | 
    Sort-Object "LastActivity" -Descending | 
    Format-Table -AutoSize
