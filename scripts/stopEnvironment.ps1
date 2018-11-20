# Eric Crossman
# 11.20.2018
# stopEnvironment.ps1

# Dependency on AzureRM module
Import-Module AzureRM

# Stop all VMs in resource group
Stop-AzureRmVM -Name MediaWiki01VM -ResourceGroupName puppetdemo
Stop-AzureRmVM -Name PuppetMasterVM -ResourceGroupName puppetdemo
 
