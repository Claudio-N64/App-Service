New-AzResourceGroup -Name ACI-pws -Location EastUS
$RG = "ACI-pws"

New-AzContainerGroup -ResourceGroupName $RG -Name mycontainer -Image mcr.microsoft.com/windows/servercore/iis:nanoserver -OsType Windows -DnsNameLabel aci-demo-win