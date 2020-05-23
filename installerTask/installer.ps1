if (Test-Path "$env:ProgramData\Chocolatey\bin\choco.exe") {
    Write-Output "choco.exe found already installed"
} else {

    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 

    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}