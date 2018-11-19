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

resource "azurerm_public_ip" "MediaWiki01PublicIP" {
  name = "MediaWiki01PublicIP"
  domain_name_label = "mediawiki01"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"
  public_ip_address_allocation = "dynamic"

  tags = {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}

resource "azurerm_public_ip" "PuppetMasterPublicIP" {
  name = "PuppetMasterPublicIP"
  domain_name_label = "ercpuppet"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"
  public_ip_address_allocation = "dynamic"

  tags = {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}

resource "azurerm_network_security_group" "puppetmasternsg" {
  name = "PuppetMasterNSG"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"

  security_rule {
    name = "SSH_From_UF"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "128.227.0.0/16"
    destination_address_prefix = "*"
  }

  security_rule {
    name = "Console_HTTPS_From_UF"
    priority = 1011
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "443"
    source_address_prefix = "128.227.0.0/16"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}

resource "azurerm_network_interface" "mediawiki01nic" {
  name = "MediaWiki01NIC"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"
  network_security_group_id = "${azurerm_network_security_group.puppetmasternsg.id}"

  ip_configuration {
    name = "MediaWiki01NicConfig"
    subnet_id = "${azurerm_subnet.puppetsubnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = "${azurerm_public_ip.MediaWiki01PublicIP.id}"
  }

  tags {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}

resource "azurerm_network_interface" "puppetmasternic" {
  name = "PuppetMasterNIC"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"
  network_security_group_id = "${azurerm_network_security_group.puppetmasternsg.id}"

  ip_configuration {
    name = "PuppetMasterNicConfig"
    subnet_id = "${azurerm_subnet.puppetsubnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = "${azurerm_public_ip.PuppetMasterPublicIP.id}"
  }

  tags {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}
