<#  .SYNOPSIS
    Powershell Script to Join a Domain. Make sure to setup your domain,User name, and Password.
    .NOTES
    filename: JoinDomain.ps1
    author: Chris Collins
    Created: 5/6/2022
    #>
    
$DomainName = "DOMAIN" # Add your domain name here
$UserName = "USER" # Add your Administrator Account Name here
$Password = "PASSWORD" # Add your Password here

try {
    Start-Transcript -Path C:\log\Join-Domain.log -Append
    $pass = ConvertTo-SecureString $Password -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName,$pass
    Add-Computer -DomainName $DomainName -Credential $cred -Restart -Force
}
catch {
    $error[0]|format-list -force  #print more detail reason for failure   
}
