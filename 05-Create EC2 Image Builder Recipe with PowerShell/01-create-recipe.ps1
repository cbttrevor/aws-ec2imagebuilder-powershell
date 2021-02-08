Get-AWSCmdletName -Service builder | ? CmdletName -match recipe

Get-Help -Name New-EC2IBImageRecipe -Online

# Find a list of components
Get-EC2IBComponentList | Format-Table -AutoSize

# Create an empty array to hold component configurations
$ComponentConfig = @()

# Create a new ComponentConfiguration object and assign the ARN
$C1 = [Amazon.ImageBuilder.Model.ComponentConfiguration]::new()
$C1.ComponentArn = 'arn:aws:imagebuilder:us-west-2:665453315198:component/installnginxapt/0.6.0'

# Add the component to the array of component configurations
$ComponentConfig += $C1

$Recipe = @{
    Name = 'UbuntuBuild'
    SemanticVersion = '0.7.0'
    Component = $ComponentConfig
    ParentImage = 'ami-07dd19a7900a1f049'
}
New-EC2IBImageRecipe @Recipe