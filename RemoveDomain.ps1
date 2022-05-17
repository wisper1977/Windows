<#
    .SYNOPSIS
    Removes computer from domain. Make sure to setup your domain,User name, and Password.
    .NOTES
    filename: RemoveDomain.ps1
    author: Chris Collins
    created: 5/6/2022
    #>
    
$DomainName = "DOMAIN" # Add your domain name here
$UserName = "USER" # Add your Administrator Account Name here
$Password = "PASSWORD" # Add your Password here

try {
    Start-Transcript -Path C:\log\Remove-Domain.log -Append
    $pass = ConvertTo-SecureString $Password -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential -ArgumentList $UserName,$pass
    remove-computer -credential $cred -passthru -verbose -Restart -Force
}
catch {
    $error[0]|format-list -force  #print more detail reason for failure   
}
