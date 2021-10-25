New-AzContainerGroup `
    -ResourceGroupName earn-deploy-aci-rg `
    -Name mycontainer-restart-demo `
    -Image microsoft/aci-wordcount:latest `
    -RestartPolicy OnFailure `
    -Location 'West Europe'
