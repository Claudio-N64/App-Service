New-AzContainerGroup `
    -ResourceGroupName earn-deploy-aci-rg `
    -Name mycontainer `
    -Image microsoft/aci-helloworld `
    -Location 'West Europe' `
    -Port 80 `
    -DnsNameLabel mydemocontainer01