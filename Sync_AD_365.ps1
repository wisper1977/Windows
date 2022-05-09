<# Powershell Script to Sync On-Prem Active Directory with Microsoft365
    author: Chris Collins
    Date: 5/6/2022
    #>

$UserName = "DOMAIN\USER" # Add your Administrator Account Name here
$Password = "PASSWORD" # Add your Password here
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

#Sync Microsoft   
    Invoke-Command -ComputerName COMPUTERNAME -ScriptBlock { Start-ADSyncSyncCycle -PolicyType Delta } -credential $credentials #Change COMPUTERNAME to the Server the script is going to run on

pause
