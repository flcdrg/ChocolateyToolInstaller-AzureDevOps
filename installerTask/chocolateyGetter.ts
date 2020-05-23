import fs from 'fs';

export async function getChocolatey(): Promise<string> {

    try {
        fs.accessSync('c:/ProgramData/Chocolatey/bin/choco.exe', fs.constants.F_OK);
    } catch (err) {
        return 'not found'
    }

    return 'found';
    
    // Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    // const installScript = await toolLib.downloadTool('https://chocolatey.org/install.ps1');

}