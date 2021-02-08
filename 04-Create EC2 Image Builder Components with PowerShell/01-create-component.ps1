# Find commands that allow you to manage EC2 Image Builder components
Get-AWSCmdletName -Service builder | Where-Object -FilterScript { $PSItem.CmdletName -match 'component' }

# Create a new component
New-EC2IBComponent -Name InstallNginxApt -Data (Get-Content -Path $PSScriptRoot/01-component.yml -Raw) -Description 'Installs NGINX using the apt package manager' -SemanticVersion '0.7.0' -Platform Linux

# What happens if you try to call the same command a second time?
#New-EC2IBComponent -Name InstallNginxApt -Data (Get-Content -Path $PSScriptRoot/01-component.yml -Raw) -Description 'Installs NGINX using the apt package manager' -SemanticVersion '0.6.0' -Platform Linux
