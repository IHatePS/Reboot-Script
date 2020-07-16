

# delete files and folders
if (Test-Path -Path C:\Test) {#change path
    #remove files within test
    if (Get-ChildItem -Path "C:\Test\" -Name "reboot.ps1") { #change path
        Remove-Item -Path "C:\Test\reboot.ps1" #change path
        Write-Host "File deleted"#remove
    } else { Write-Host "File does not exist"}#remove

    if (Get-ChildItem -Path "C:\Test\" -Name "rebootfinal.exe") {#change path
        Remove-Item -Path "C:\Test\rebootfinal.exe" #change path
        Write-Host "File deleted" #remove
    } else { Write-Host "File does not exist"} #remove

    #remove files within Test\Protocol Registration and deletes the folder
    if (Test-Path -Path "C:\Test\Protocol Registration") {#change path
        if (Get-ChildItem -Path "C:\Test\Protocol Registration" -Name "BurntToast.cmd") {#change path
            Remove-Item -Path "C:\Test\Protocol Registration\BurntToast.cmd"#change path
            Write-Host "file deleted"#remove
        } else {
            Write-Host "File does not exist"#remove
        }

        if (Get-ChildItem -Path "C:\Test\Protocol Registration" -Name "register-protocol.reg") {#change path
            Remove-Item -Path "C:\Test\Protocol Registration\register-protocol.reg" #change path
            Write-Host "File deleted"#remove
        } else {
            Write-Host "File does not exist"#remove
        }

        if (Get-ChildItem -Path "C:\Test\Protocol Registration") {#change path
            Write-Host "Protocol Registration contains data"#remove
        } else { 
            Remove-Item -Path "C:\Test\Protocol Registration"#change path
            Write-Host "Protocol Registration has been deleted"#remove
        }
    }

    #Checks for files within Test and deletes the folder
    if (Get-ChildItem -Path "C:\Test") {#change path
        Write-Host "Test folder contaons data"#remove
    } else {
        Remove-Item -Path "C:\Test"#change path
        Write-Host "Test folder has been deleted"#remove
    }

} else {} #Add README

#remove registry key
if ((Test-Path HKCR:\powershell\shell\open\command) -eq $true) {
    Remove-Item HKCR:\powershell -recurse
    Write-Host "reg key removed"
} else {}

#remove scheduled task
if (Get-ScheduledTask -TaskName "Reboot Script" -ErrorAction SilentlyContinue) {
    Unregister-ScheduledTask -TaskName "Reboot Script" -Confirm:$false
    Write-Host "scheduled task deleted"
} else {}















