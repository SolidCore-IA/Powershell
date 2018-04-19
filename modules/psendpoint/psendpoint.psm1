# Gives cmdlets for working with desktop, laptops, and terminal/server infos
#
# list all terminal names
function show-terminals {
    dsquery computer -name "*terminal*" | dsget computer -samid}
#
# see if remote registry is enabled and enable it
function get-psexec ([String]$pcname) {
    Get-Service WinRm,RemoteRegistry -computername $pcname | Select-Object -Property Name,StartType,Status}
#
# get-pcinfo cmdlet
function Get-PcInfo {
    # Target device must have winrm/ps remoting enabled
    param ([String] $pcname = "$env:computername")
    Get-CimInstance -ComputerName $pcname -ClassName win32_operatingsystem | Select-Object csname, UserName, lastbootuptime}
# hostname or IP lookup
function find-pcname ($pcip) {
    [System.Net.Dns]::GetHostEntry("$pcip").HostName}
function find-pcip ($pcname) {
    [System.Net.DNS]::GetHostAddresses("$pcname").IPAddressToString}
#
function show-pcinfo ($pcname) {
    if (Test-Connection -ComputerName "$pcname" -Quiet) {
        Test-Connection "$pcname" -Count 1
        Write-Host "**"
        Write-Host "*Current User*"
        PsLoggedon -l \\"$pcname"
        Write-Host "**"
        Write-Host "*Up Time*"
        uptime.exe "$pcname"
        }
    else
        {"Remote device '$pcname' not found"}
}
#
# ____________________________________________________________________________
# Below is all remote device connection functions and such
#
# Create PSSession on good ping
function invoke-pss {
    param ([String] $pcname = "$env:computername")
    if (Test-Connection -ComputerName "$pcname" -Quiet) 
        {New-PSSession $pcname}
    else 
        {"Remote sync path '$rmtdir' not found"}
}
#
function psx ($pcname) {
    if (Test-Connection -ComputerName "$pcname" -Quiet)
        {psexec -u domain\username \\"$pcname" cmd}
    else
        {"Remote device '$pcname' not found"}
}