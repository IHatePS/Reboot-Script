
import-module BurntToast
$userSystem = Get-WmiObject win32_operatingsystem 
$uptime= (Get-Date) - $userSystem.ConvertToDateTime($userSystem.LastBootUpTime)
 if ($Uptime.days -ge 3) {
    $Text1 = New-BTText -Content "Your computer may need to restart"
    $Text2 = New-BTText -Content "Click here to restart your computer"

    $Binding1 = New-BTBinding -Children $Text1, $Text2

    $Visual1 = New-BTVisual -BindingGeneric $Binding1
    $button1 = New-BTButton -Content "Restart" -Arguments "powershell://C:\Test\reboot.ps1" -ActivationType Protocol
    $button2 = New-BTButton -Dismiss


    $action1 = New-BTAction -Buttons $button1, $button2 

    $Content1 = New-BTContent -Visual $Visual1 -Actions $action1 -ActivationType Protocol

    Submit-BTNotification -Content $Content1
 }
