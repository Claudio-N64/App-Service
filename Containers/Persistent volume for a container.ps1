#region  Set various variables
$resgroup = "acideploy"
$stor_RSG = "STORAGE-RSG"
$location = "Westeurope"
$Storagekey = (Get-AzStorageAccountKey -ResourceGroupName $stor_RSG -Name claudione2020 | Where-Object -FilterScript { $_.KeyName -eq "key1" }).Value
$Stor_name = "claudione2020"
$Context = New-AzStorageContext -StorageAccountName  $Stor_name -StorageAccountKey $Storagekey
$secpasswd = ConvertTo-SecureString "$Storagekey" -AsPlainText -Force
$mycred = New-Object System.Management.Automation.PSCredential ("$Stor_name", $secpasswd)

#endregion

#region Create a file share on a storage account
New-AzStorageShare -Name "myshare" -Context $Context
#endregion

#region  Create a container with file share on it
New-AzContainerGroup `
    -Name aci-demo-files `
    -Image microsoft/aci-hellofiles `
    -ResourceGroupName $resgroup `
    -Location $location `
    -Port 80 `
    -IpAddressType Public `
    -AzureFileVolumeShareName myshare `
    -AzureFileVolumeAccountCredential $mycred `
    -AzureFileVolumeMountPath /aci/logs

#endregion