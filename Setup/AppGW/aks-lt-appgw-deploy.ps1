param([Parameter(Mandatory=$false)] [string] $rg = "jmeter-workshop-rg",
        [Parameter(Mandatory=$false)] [string] $fpath = "/Users/monojitd/Materials/Projects/AKSProjects/LoadTests/NginxCacheLoadTest/Setup",
[Parameter(Mandatory=$false)] [string] $deployFileName = "aks-lt-appgw-deploy", 
        [Parameter(Mandatory=$false)] [string] $appgwName = "aks-lt-appgw",
        [Parameter(Mandatory=$false)] [string] $vnetName = "aks-lt-vnet",
        [Parameter(Mandatory=$false)] [string] $subnetName = "aks-lt-appgw-subnet",
        [Parameter(Mandatory=$false)] [string] $backendIPAddress = "187.0.0.200",
        [Parameter(Mandatory=$false)] [string] $backendPoolHostName = "internal.wkshpdev.com",
        [Parameter(Mandatory=$false)] [string] $listenerHostName = "wkshpdev.com")

Test-AzResourceGroupDeployment -ResourceGroupName $rg `
-TemplateFile "$fpath/AppGW/$deployFileName.json" `
-TemplateParameterFile "$fpath/AppGW/$deployFileName.parameters.json" `
-applicationGatewayName $appgwName `
-vnetName $vnetName -subnetName $subnetName `
-backendPoolHostName $backendPoolHostName `
-listenerHostName $listenerHostName

New-AzResourceGroupDeployment -ResourceGroupName $rg `
-TemplateFile "$fpath/AppGW/$deployFileName.json" `
-TemplateParameterFile "$fpath/AppGW/$deployFileName.parameters.json" `
-applicationGatewayName $appgwName `
-vnetName $vnetName -subnetName $subnetName `
-backendPoolHostName $backendPoolHostName `
-listenerHostName $listenerHostName