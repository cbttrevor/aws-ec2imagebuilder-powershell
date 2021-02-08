# Now let's manually invoke our pipeline. You can use this code from anywhere (Fargate container, EC2 instance, Lambda function) to invoke an EC2 Image Builder pipeline.

Get-AWSCmdletName -Service builder | ? CmdletName -match pipeline

# Alright, now we know which command to use to invoke an EC2 Image Builder pipeline ... 
# ... but what parameters do we need to specify?
Start-EC2IBImagePipelineExecution -ImagePipelineArn 

Get-EC2IBImagePipelineList

