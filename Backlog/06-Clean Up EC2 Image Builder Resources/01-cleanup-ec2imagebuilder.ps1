Get-EC2IBImagePipelineList | % { 
    Remove-EC2IBImagePipeline -ImagePipelineArn $PSItem.Arn -Force
}

Write-Host -ForegroundColor Gree -Object 'Finished removing EC2 Image Builder pipelines'

Get-EC2IBImageRecipeList | % { 
    Remove-EC2IBImageRecipe -ImageRecipeArn $PSItem.Arn -Force
}

Write-Host -ForegroundColor Gree -Object 'Finished removing EC2 Image Builder OS recipes'

# This skill focused on creating operating system image builds, but you might also need to clean up container recipes
Get-EC2IBContainerRecipeList | % { 
    Remove-EC2IBContainerRecipe -ContainerRecipeArn $PSItem.Arn -Force
}

Write-Host -ForegroundColor Gree -Object 'Finished removing EC2 Image Builder container recipes'

Get-EC2IBComponentList | % {
    (Get-EC2IBComponent -ComponentBuildVersionArn $PSItem.Arn).Arn | Remove-EC2IBComponent -Force
}

Write-Host -ForegroundColor Gree -Object 'Finished removing EC2 Image Builder components'

Get-EC2IBInfrastructureConfigurationList | Select-Object -ExpandProperty Arn | Remove-EC2IBInfrastructureConfiguration