# https://github.com/microsoft/azure-pipelines-task-lib

Trace-VstsEnteringInvocation $MyInvocation

$chocoInstallLocation = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "Machine")
if(-not (Test-Path $chocoInstallLocation)) {
    Write-Output "Environment variable 'ChocolateyInstall' was not found in the system variables. Attempting to find it in the user variables..."
    $chocoInstallLocation = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "User")
}

$chocoExe = "$chocoInstallLocation\choco.exe"

$doInstall = $false

if (Test-Path $chocoExe) {
    Write-Output "choco.exe found already installed"
} else {
    $doInstall = $true
}

[bool]$force = Get-VstsInput -Name 'force' -AsBool -Default $false

if ($doInstall -or $force) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 

    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Trace-VstsLeavingInvocation $MyInvocation