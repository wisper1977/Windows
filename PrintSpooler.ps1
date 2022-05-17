<#  .SYNOPSIS
    Powershell Script to restart the Print Spooler. Make sure to setup your domain,User name, and Password.
    .NOTES
    filename: PrintSpooler.ps1
    author: Chris Collins
    created: 5/6/2022
    author: Chris Collins
    created: 5/6/2022
    #>

$username = "DOMAIN\USER" # Use your Administrator Logon Credentials
$password = "PASSWORD" # Use your Administrator Password
$credentials = New-Object System.Management.Automation.PSCredential -ArgumentList @($username,(ConvertTo-SecureString -String $password -AsPlainText -Force))

# Self-elevate the script if required
# From:  https://blog.expta.com/2017/03/how-to-self-elevate-powershell-script.html
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-noexit -noprofile -File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
   Start-Process Powershell -Verb Runas -ArgumentList $CommandLine # work, but no credential
  # Start-Process PowerShell -Cred $credentials -Verb Runas -ArgumentList $CommandLine # both credential and runas, doesnt work.
  Exit
 }
}

#Append Log File
Start-Transcript -Path C:\log\Print-Spooler.log -Append

#Restart Printer Spooler    
    net stop spooler
    net start spooler

pause
