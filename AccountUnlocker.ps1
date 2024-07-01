cls

do {
    Write-Host "Account Unlocker script is running..." -ForegroundColor Green -BackgroundColor Black
    $name = Read-Host -Prompt 'type in username'
    Unlock-ADAccount -identity "$name"
    
    if($?) 
        {
          Write-Host "Account unlocked!"  -ForegroundColor Green -BackgroundColor Black
        }  
        else
        {
          Write-Host "Command failed, please press y and try again" -ForegroundColor Red -BackgroundColor Black
        }
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