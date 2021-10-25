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
$COSMOS_DB_MASTERKEY = Get-AzCosmosDBAccountKey -Name $DB_name -ResourceGroupName $rgroup | Select-Object { $_.PrimaryMasterKey }