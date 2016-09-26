
$url = "https://github.com/PowerShellOrg/cChoco/archive/master.zip"
$currDir = (Get-Item -Path ".\" -Verbose).FullName
$output = "$currDir\cChoco.zip"

if (!(Test-Path $env:ProgramFiles\WindowsPowerShell\Modules\cChoco)) {

    if (Test-Path $currDir\$output) { 
        Remove-Item -Force $currDir\$output
    }

    Write-Host "Downloading [$url]`nSaving at [$output]" 
    Invoke-WebRequest $url -OutFile $output
    Write-Host "Unzipping [$output]" 
    Expand-Archive $output $currDir\.
    Write-Host "Copy8ing the cChoco modules to [$env:ProgramFiles\WindowsPowerShell\Modules\cChoco]" 
    Copy-Item -Recurse $currDir\cChoco-master $env:ProgramFiles\WindowsPowerShell\Modules\cChoco
    Remove-Item -Force -Recurse $output
    Remove-Item -Force -Recurse $currDir\cChoco-master

}

else {
    Write-Host "DSC Resource Choco already installed"
    Get-DscResource cChoco*
}