#region Variables for Cosmos DB
$rgroup = 'acideploy'
$Location = "Westeurope"
$DB_name = "aci-cosmos-db2021q"
#endregion End Variables

#region  Script for a new Cosmos DB
New-AzCosmosDBAccount `
    -ResourceGroupName $rgroup `
    -Location $Location `
    -Name $DB_name

#endregion

#region Variables for ACI environment variables
$COSMOS_DB_ENDPOINT = (Get-AzCosmosDBAccount -ResourceGroupName $rgroup -Name $DB_name ).DocumentEndpoint
$COSMOS_DB_MASTERKEY = Get-AzCosmosDBAccountKey -Name $DB_name -ResourceGroupName $rgroup
$PrimaryKey = $COSMOS_DB_MASTERKEY.PrimaryMasterKey
$Varenvir = @{COSMOS_DB_ENDPOINT = $COSMOS_DB_ENDPOINT; COSMOS_DB_MASTERKEY = $PrimaryKey }
#endregion End of variables for ACI

#region  New Container
New-AzContainerGroup `
    -ResourceGroupName $rgroup `
    -Name aci-demo `
    -Image microsoft/azure-vote-front:cosmosdb `
    -IpAddressType Public `
    -EnvironmentVariable $Varenvir

#endregion