#
Import-Module ActiveDirectory
# This module gives quick AD funcitons:
# find ad user info
Function show-user {
    param ([String]$uname)
    Get-AdUser -identity $uname -Properties Name,CanonicalName,EmailAddress,telephoneNumber,Manager,CannotChangePassword,Enabled,LockedOut,PasswordExpired,PasswordLastSet,PasswordNeverExpires,HomeDirectory|select-object -Property Name,CanonicalName,EmailAddress,telephoneNumber,Manager,CannotChangePassword,Enabled,LockedOut,PasswordExpired,PasswordLastSet,PasswordNeverExpires,HomeDirectory
}
#
Function reset-pwd ([String]$uname) {
    #$newpwd = Read-Host "Enter the new password" -AsSecureString
    Set-ADAccountPassword -identity $uname -NewPassword $newpwd -Reset -confirm -PassThru
    Write-Host "$uname password reset"
}
Function enable-aduser ([String]$uname) {
    Enable-ADAccount -Identity $uname -Confirm -PassThru|Select-Object -Property Name,Enabled
    Write-Host '$uname account enabled'
}
Function disable-adpc {
    param ([String]$pcname)
    $username = [String]::Format("{0} has been disabled and moved to disabled workstations",$pcname)
    $adpcname=get-adcomputer $pcname -Properties distinguishedname|Select-Object -Property distinguishedname
    Disable-ADAccount $adpcname -Confirm -PassThru|Select-Object -Property Name,Enabled
    Move-ADObject -Identity $adpcname -TargetPath 'OU=Workstations,OU=Disabled Computers,DC=DOMAIN,DC=local' -Confirm -PassThru|Select-Object -Property distinguishedname,Enabled
    Write-Host $username
}