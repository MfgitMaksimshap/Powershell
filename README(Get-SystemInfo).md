# Get-SystemInfo.ps1 🚀

A simple but powerful PowerShell one-liner script to quickly gather basic system information. Ideal for system administrators, helpdesk personnel, and power users who need a fast, native way to get a snapshot of a machine's state.

## 📋 What It Does

This script collects the following key pieces of information:
* **Computer Name**: The hostname of the machine.
* **IP Address**: The primary, active IPv4 address.
* **Windows Version**: The full product name of the OS (e.g., "Windows 11 Pro").
* **OS Install Date**: The date and time the operating system was originally installed.
* **System Uptime**: The duration since the last reboot.

## ⚙️ How to Use

Simply run the `Get-SystemInfo.ps1` script in a PowerShell terminal.

```powershell
.\Get-SystemInfo.ps1
```

### Example Output

```
ComputerName    : DESKTOP-EXAMPLE
IPAddress       : 192.168.1.10
WindowsVersion  : Windows 11 Pro
InstallDate     : 5/15/2024 10:30:15 AM
Uptime          : 2.04:11:23.1234567
```

## ✨ Customization

### Remote Execution
Run the script against a remote computer using `Invoke-Command`:
```powershell
Invoke-Command -ComputerName "REMOTE-PC-01" -FilePath .\Get-SystemInfo.ps1
```

### Exporting Data
You can easily export the output to various formats. Replace `Format-List` at the end of the script with:
* **To a text file:** `| Out-File -FilePath C:\temp\info.txt`
* **To a CSV file:** `| Export-Csv -Path C:\temp\info.csv -NoTypeInformation`
* **To an HTML report:** `| ConvertTo-Html | Out-File C:\temp\info.html`

## 📄 License
This project is licensed under the MIT License.
