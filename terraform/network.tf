resource "azurerm_virtual_network" "puppet_demo_network" {
  name = "puppet_demo_network"
  address_space = ["192.168.0.0/16"]
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"

  tags = {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}

resource "azurerm_subnet" "puppetsubnet" {
  name = "puppetsubnet"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"
  virtual_network_name = "${azurerm_virtual_network.puppet_demo_network.name}"
  address_prefix = "192.168.72.0/24"
}

resource "azurerm_public_ip" "PuppetMasterPublicIP" {
  name = "PuppetMasterPublicIP"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"
  public_ip_address_allocation = "dynamic"

  tags = {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}
