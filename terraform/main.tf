provider "azurerm" {

}

resource "azurerm_resource_group" "puppetdemo" {
  name = "puppetdemo"
  location = "eastus"

  tags = {
    environment = "demo"
    ProjectId = "PuppetEnterpriseEval"
  }
}
