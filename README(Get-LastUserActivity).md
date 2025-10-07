# Get-LastUserActivity.ps1 🕵️‍♂️

A PowerShell script to quickly determine the last activity time for all user profiles on a Windows machine.

This tool is invaluable for system administrators, IT support, and security professionals who need to audit user activity, identify inactive accounts, or perform forensic analysis.

## 📋 How It Works

The script leverages a simple but highly reliable method: it checks the **last modification date** of each user's `NTUSER.DAT` file.

**What is `NTUSER.DAT`?**
It's a core system file located in each user's profile directory (`C:\Users\Username`). This file contains the user's personal registry hive, which Windows modifies every time the user logs off or shuts down the computer. This makes its `LastWriteTime` timestamp an excellent proxy for the end of the user's last session.

This method is significantly faster and often more practical than parsing large security event logs.

## ⚙️ Usage

Clone the repository or download the `Get-LastUserActivity.ps1` script. Then, run it from a PowerShell terminal with administrative privileges (required to access all user folders).

```powershell
.\Get-LastUserActivity.ps1
```

### Example Output

```
User           LastActivity
----           ------------
admin          10/7/2025 8:30:11 AM
d.ivanov       10/6/2025 6:15:45 PM
a.petrov       9/1/2025 12:00:22 PM
```
The list is sorted to show the most recently active user at the top.

## 📄 License
This project is licensed under the MIT License.
