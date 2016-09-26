Configuration Development
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName cChoco
    $currDir = (Get-Item -Path ".\" -Verbose).FullName

    cChocoInstaller init
    {
        InstallDir = "$currDir\choco"
    }

    cChocoPackageInstallerSet packages
    {
        Ensure = "Present"
        Name = @(
            "chocolatey",
            "googlechrome",
            "git",
            "sublimetext3",
            "vlc"
        )
        DependsOn = "[cChocoInstaller]init"
    }
}

