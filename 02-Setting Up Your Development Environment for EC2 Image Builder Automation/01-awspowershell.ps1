# Search for AWS PowerShell module
# But why are there two different modules to install?
Find-Module -Name AWSPow*

# Search for the non-monolithic AWS PowerShell modules
# IMPORTANT: Don't install both the monolithic and non-monolithic modules
Find-Module -Name AWS.Tools* | Sort-Object -Property Name | Select-Object -Property Name, Version, Description | Out-ConsoleGridView

# Install the monolithic cross-platform AWS SDK for PowerShell
Install-Module -Name AWSPowerShell.NetCore -Scope CurrentUser -Force

# Install the non-monolithic module for EC2 Image Builder
Install-Module -Name AWS.Tools.ImageBuilder -Scope CurrentUser -Force
