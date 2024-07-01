cls

do {
    Write-Host "Script is running..." -ForegroundColor Green -BackgroundColor Black
    $name = Read-Host -Prompt 'type in username'
    $Manager = get-aduser $name -properties * | Select -ExpandProperty Manager
    $username= Get-ADUser  -identity "$name" -Properties * | Select Name -ExpandProperty displayname
    $mail= Get-ADUser  -identity "$name" -Properties * | Select mail -ExpandProperty Mail
    $title= Get-ADUser  -identity "$name" -Properties * | Select title -ExpandProperty Title
    $dept= Get-ADUser  -identity "$name" -properties * | Select Department -ExpandProperty Department
    $eid= Get-ADUser  -identity "$name" -Properties * | Select EmployeeID -ExpandProperty EmployeeID
    $mgmdata= Get-ADUser  -identity "$Manager" -Properties * | Select Manager -ExpandProperty displayname
    $pswddata= Get-aduser $name -properties * | % passwordlastset
    

    Write-host "Users name   |"$username""
    Write-host "Email        |"$mail""     
    Write-host "Title        |"$title""    
    Write-host "Dept         |"$dept""     
    Write-host "EID          |"$eid""      
    Write-host "PwdLastSet   |"$pswddata""
    Write-host "Manager      |"$mgmdata""
    do {
        $Again = Read-Host "Do you want to run the script again? (Y/N)"
        if (($Again -eq "Y") -or ($Again -eq "N")) {
            $Go = $true
        }
        else {
            Write-Error "Invalid input. Please try again."
            $Go = $false
        }
    } until ($Go)
} until ($Again -eq "N")
Write-Host "Script completed. Created by Liamk99. Follow me on github https://github.com/Liamk99" -ForegroundColor Green -BackgroundColor Black
Write-Host "Press any key to continue" -ForegroundColor Green -BackgroundColor Black
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');