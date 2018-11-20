# Eric Crossman
# 11.20.2018
# startEnvironment.ps1

# Dependency on AzureRM module
Import-Module AzureRM

# Start all VMs in resource group.
Start-AzureRMVM -Name MediaWiki01VM -ResourceGroupName puppetdemo
Start-AzureRMVM -Name PuppetMasterVM -ResourceGroupName puppetdemo
