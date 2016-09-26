Param(
  [string]$dscConfiguration
)

Write-Host "Enacting the $dscConfiguration DSC configuration"

$currDir = (Get-Item -Path ".\" -Verbose).FullName
Write-Host "The current directory is $currDir"

if (Test-Path "$currDir\$dscConfiguration") { 
    Remove-Item -Force -Recurse "$currDir\$dscConfiguration"
}

. "$currDir\dsc\$dscConfiguration.ps1"
& "$dscConfiguration"

Start-DscConfiguration -Force -Wait -ComputerName localhost -Path "$currDir\$dscConfiguration"

Write-Host "$dscConfiguration DSC configuration enacted"