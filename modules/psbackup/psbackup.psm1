#
Function psbackup {
    # Variables
    $basedir="$ENV:UserProfile"
    $rmtdir="\\devicename\c$\users\mbrinkord\Documents"
    $poshdir="Documents\WindowsPowerShell\"
    #
    if (Test-Path $rmtdir){
        Copy-Item $basedir\$poshdir -Destination $rmtdir -Recurse -Force
        #Write-Progress -Activity "test" -Completed -Status "done test"
        Write-Host "PoSh Profile is now synced" -ForegroundColor red -BackgroundColor white
        }
    else
        {"Remote sync path '$rmtdir' not found"}
}