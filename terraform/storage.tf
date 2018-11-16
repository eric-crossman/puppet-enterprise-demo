resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a resource group is defined
    resource_group = "${azurerm_resource_group.puppetdemo.name}"
  }

  byte_length = 8
}

resource "azurerm_storage_account" "diagstorageaccount" {
  name = "diag${random_id.randomId.hex}"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"
  location = "eastus"
  account_replication_type = "LRS"
  account_tier = "Standard"

  tags {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}
