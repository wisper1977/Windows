<#  .SYNOPSIS
    Powershell Script to Rename a PC. Make sure to setup your domain,User name, and Password.
    .NOTES
    filename: RenamePC.ps1
    author: Chris Collins
    created: 5/6/2022
    #>
    
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]
    $School,

    [Parameter(Mandatory=$true)]
    [string]
    $Type,

    [Parameter(Mandatory=$true)]
    [string]
    $AssetTag
)

try {
    Start-Transcript -Path C:\log\Rename.log -Append
    $UserName = "USER" # Add your Administrator Account Name here
    $Password = "PASSWORD" # Add your Password here
    $pass = ConvertTo-SecureString $Password -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName,$pass
    Rename-Computer -NewName $School"-"$Type"-"$AssetTag -LocalCredential $cred -Restart # Change $School"-"$Type"-"$AssetTag to desired naming convention
}
catch {
    $error[0]|format-list -force  #print more detail reason for failure   
}
