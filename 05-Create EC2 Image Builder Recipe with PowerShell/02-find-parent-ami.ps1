$FilterList = @()

$Filter = [Amazon.EC2.Model.Filter]::new()
$Filter.Name = 'owner-alias'
$Filter.Value = 'amazon'
$FilterList += $Filter

$Filter = [Amazon.EC2.Model.Filter]::new()
$Filter.Name = 'architecture'
$Filter.Value = 'x86_64'
$FilterList += $Filter

$Filter = [Amazon.EC2.Model.Filter]::new()
$Filter.Name = 'name'
$Filter.Value = '*ubuntu*'
$FilterList += $Filter

$Filter = [Amazon.EC2.Model.Filter]::new()
$Filter.Name = 'architecture'
$Filter.Value = 'x86_64'
$FilterList += $Filter

$ImageList = Get-EC2Image -Filter $FilterList

$ImageList | Where-Object -FilterScript { ((Get-Date) - ([DateTime]$PSItem.CreationDate)).TotalDays -lt 180 } | Select-Object -Property Name
