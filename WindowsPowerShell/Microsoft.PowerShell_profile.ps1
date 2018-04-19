
#    _____                              __________   
#    /     \ _____    ____   ____ ___.__.\______   \ 
#   /  \ /  \\__  \  /    \ /    <   |  | |    |  _/ 
#  /    Y    \/ __ \|   |  \   |  \___  | |    |   \ 
#  \____|__  (____  /___|  /___|  / ____| |______  / 
#          \/     \/     \/     \/\/             \/  
# 
#
##### Modules setups #####
function add-module {
    # Real work modules
    Import-Module psadadmin
    Import-Module psendpoint
    Import-Module PSReadLine
    # Terminal modules
    Import-Module PsGet
    Import-Module PsUrl
    Import-Module PSClip
    Import-Module psbackup
    # Misc moduels
    Import-Module PSColor
    Import-Module go
    ##update-help
    # Loads *.exe cli tools from PSExtras
    #Import-Module PSExtras
}
function check-module {
    param ([String] $module)
    If ( ! (Get-module $module)) {
        Import-Module $module
        Write-Host "Module sourced"}
    else {"'$moddule' already loaded"}
}
#
##### Session variables #######
#Set-Alias reload "& .\$profile"
$posh="$ENV:UserProfile\Documents\WindowsPowerShell"
$pscr="$ENV:UserProfile\Documents\WindowsPowerShell\scripts"
$logdir="$ENV:UserProfile\Documents\WindowsPowerShell\logs"
$desk="$ENV:UserProfile\Desktop"
# Save domain admin creds
#$global:cred=Get-Credential -UserName DOMAIN\USERNAME -Message "Enter Domain Admin Password" ## SAVES ADMIN CREDS AS VARIABLE TO USE IN CMDLETS
# Below sets my script directory variable
#[Environment]::SetEnvironmentVariable("psscripts", "$ENV:UserProfile\Documents\WindowsPowerShell\scripts", "User")
#
#
##### Prompt settings #######
Function Prompt {   
    $host.ui.RawUI.WindowTitle = "MannyB@$env:computername"
    Write-Host "_<" -NoNewline -ForegroundColor red
    Write-Host "$pwd" #-NoNewline
    Write-Host "@$env:computername" -NoNewline
    Write-host " >_" -NoNewline -ForegroundColor red
    return " "
}
#
#
###### PSREADLINE SETUP ###### add readline stuff below here
#
###### ALIAS & FUNCTIONS ########
# Trash Alias
Function trash {
    param ($file)
    Remove-Item -Confirm $file -Force}
# Home alias
function home {
    Set-Location $ENV:UserProfile\Desktop
    Clear-Host}
Function goposh {
    Set-Location $posh
    Get-ChildItem}
function rdns {
    ipconfig.exe /flushdns
    ipconfig.exe /registerdns
    Test-Connection 9.9.9.9 -count 2 -quiet}
function pdv ($pcname) {
    Test-Connection $pcname -count 2 -quiet}
# non-stop ping action
function watch-connect ($pcname) {
    while($true){test-connection $pcname -count 2 -Quiet}{offline}}
function get-some {
    Write-Host "Get Some!!!" -ForegroundColor red -BackgroundColor white
}
function get-env {
    start rundll32.exe sysdm.cpl,EditEnvironmentVariables
}
Function get-usb {
    start RunDll32.exe shell32.dll,Control_RunDLL hotplug.dll
}
Function wanip {
    nslookup myip.opendns.com resolver1.opendns.com
}
#
##
#### NOW WE GO HOME ####
home