cls

do {
    Write-Host "Script is running..." -ForegroundColor Green -BackgroundColor Black
    $name = Read-Host -Prompt 'Enter Computer Name'
    $os= Get-ADComputer  -identity "$name" -Properties * | Select OperatingSystem -ExpandProperty OperatingSystem
    $hostname = Get-ADComputer  -identity "$name" -Properties * | Select DNSHostName -ExpandProperty DNSHostName
    $disname = Get-ADComputer  -identity "$name" -Properties * | Select CanonicalName -ExpandProperty CanonicalName
    

    Write-host "Name       |"$hostname""
    Write-host "OS         |"$os""     
    Write-host "OU Info    |"$disname""    
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