# Use PowerShell Splatting to simplify the call to New-EC2IBComponent, and import a larger library of components
$ComponentList = @(
    @{
        Name = 'InstallNginxApt'
        Data = (Get-Content -Path $PSScriptRoot/01-component.yml -Raw)
        Description = 'Installs NGINX using the apt package manager'
        SemanticVersion = '0.6.0'
        Platform = 'Linux'
    }
    @{
        Name = 'InstallDockerApt'
        Data = (Get-Content -Path $PSScriptRoot/02-component-docker.yml -Raw)
        Description = 'Installs Docker using the apt package manager'
        SemanticVersion = '0.4.0'
        Platform = 'Linux'
    }
)

foreach ($Component in $ComponentList) {
    New-EC2IBComponent @Component
}