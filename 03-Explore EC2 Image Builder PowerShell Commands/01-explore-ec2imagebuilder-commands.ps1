# Find modules installed on your system, but not necessarily imported
Get-Module -ListAvailable

# Import the monolithic AWSPowerShell module
Import-Module -Name AWSPowerShell.NetCore

# Import just EC2 Image Builder non-monolithic module
Import-Module -Name AWS.Tools.ImageBuilder

# Find commands in the AWS PowerShell module that manage EC2 Image Builder
Get-AWSCmdletName -Service builder

# Use PowerShell's native command exploration to find commands for EC2 Image Builder
Get-Command -Module AWSPowerShell.NetCore -Name *-EC2IB*
