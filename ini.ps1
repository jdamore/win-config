Write-Host "Adding the NuGet PackageProvider"
Install-PackageProvider -Name NuGet -Scope AllUsers -MinimumVersion 2.8.5.201
Write-Host "NuGet PackageProvider added"

Write-Host "Adding the Chocolatey PackageSource"
Register-PackageSource -Force -Name Chocolatey -Location http://chocolatey.org/api/v2 -Provider NuGet -Trusted
Write-Host "Chocolatey PackageSource added"

Write-Host "Installing the Chocolatey DSC Resources"
. .\ini-cChoco.ps1
Write-Host "Chocolatey DSC Resources unbstalled"

Write-Host "Starting the WinRM service"
Start-Service winrm
Write-Host "WinRM service started"
