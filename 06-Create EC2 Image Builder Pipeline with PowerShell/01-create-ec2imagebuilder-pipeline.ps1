# Find PowerShell commands pertaining to EC2 Image Builder pipelines
Get-AWSCmdletName -Service builder | ? CmdletName -match pipe
Get-AWSCmdletName -Service builder | ? CmdletName -match distribut

# Looks like we want the New-EC2IBImagePipeline command
Get-Help -Name New-EC2IBImagePipeline -Online

# Find the ARN of the Distribution Settings that we want to use
Get-EC2IBDistributionConfigurationList

# Find the image recipe that we want to use
Get-EC2IBImageRecipeList

# Find the infrastructure configuration
Get-EC2IBInfrastructureConfigurationList

# Use PowerShell Splatting to invoke the creation of a pipeline
$PipelineParams = @{
    Name = 'UbuntuBuildFromPwsh'
    Description = 'Builds an Ubuntu Image, with NGINX, created from AWS PowerShell'
    ImageRecipeArn = 'arn:aws:imagebuilder:us-west-2:665453315198:image-recipe/ubuntubuild/0.7.0'
    InfrastructureConfigurationArn = 'arn:aws:imagebuilder:us-west-2:665453315198:infrastructure-configuration/cbtnuggetsdemo'
    DistributionConfigurationArn = 'arn:aws:imagebuilder:us-west-2:665453315198:distribution-configuration/ubuntu20pwshdist'
}
New-EC2IBImagePipeline @PipelineParams

Start-EC2IBImagePipelineExecution -ImagePipelineArn arn:aws:imagebuilder:us-west-2:665453315198:image-pipeline/ubuntubuildfrompwsh