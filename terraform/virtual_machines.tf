resource "azurerm_virtual_machine" "puppetmastervm" {
  name = "PuppetMasterVM"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"
  network_interface_ids = ["${azurerm_network_interface.puppetmasternic.id}"]
  vm_size = "Standard_D2s_v3"

  storage_os_disk {
    name = "PuppetMasterOsDisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "OpenLogic"
    offer = "CentOS"
    sku = "7.3"
    version = "latest"
  }

  os_profile {
    computer_name = "puppet"
    admin_username = "azureuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys = {
      path = "/home/azureuser/.ssh/authorized_keys"
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzWGZW7RfyRPR5Xb8bJv9Xpl1YCxMjQFhLBKzLVr0n+3A6+YC51dxM8mhiGn8x+h4sIdIEIt+ilU3iLJgoe+QFtf1x8fes68OWm8PMI7BcAJ3keiH65X6S+DCWGB3ZL2kr4BSZ54jReAQxk7vqTOI3t+ehltun1kKW83ZpDQe3i2soLpD/5eY3G2IVjHnDBT7y/pqY7wM7mpNGL44GtVzu4/hmDF6Fp0p438fJ1FmaZy8w+GV3z+Rdxl0V8hqNJy/VZ+flPABFoEg3JogL0FMXh32FANfxND7Os5azYx43R6XW1Sghcuigyia3tzv5RCog9CZu+uS34V7WqA5Yoj7b"
    }
  }

  boot_diagnostics {
    enabled = "true"
    storage_uri = "${azurerm_storage_account.diagstorageaccount.primary_blob_endpoint}"
  }

  tags {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}

# Example MediaWiki virtual machine
resource "azurerm_virtual_machine" "mediawikivm" {
  name = "MediaWiki01VM"
  location = "eastus"
  resource_group_name = "${azurerm_resource_group.puppetdemo.name}"
  network_interface_ids = ["${azurerm_network_interface.puppetmasternic.id}"]
  vm_size = "Standard_B1s"

  storage_os_disk {
    name = "MediaWiki01OsDisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "OpenLogic"
    offer = "CentOS"
    sku = "7.3"
    version = "latest"
  }

  os_profile {
    computer_name = "mediawiki01"
    admin_username = "azureuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys = {
      path = "/home/azureuser/.ssh/authorized_keys"
      key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzWGZW7RfyRPR5Xb8bJv9Xpl1YCxMjQFhLBKzLVr0n+3A6+YC51dxM8mhiGn8x+h4sIdIEIt+ilU3iLJgoe+QFtf1x8fes68OWm8PMI7BcAJ3keiH65X6S+DCWGB3ZL2kr4BSZ54jReAQxk7vqTOI3t+ehltun1kKW83ZpDQe3i2soLpD/5eY3G2IVjHnDBT7y/pqY7wM7mpNGL44GtVzu4/hmDF6Fp0p438fJ1FmaZy8w+GV3z+Rdxl0V8hqNJy/VZ+flPABFoEg3JogL0FMXh32FANfxND7Os5azYx43R6XW1Sghcuigyia3tzv5RCog9CZu+uS34V7WqA5Yoj7b"
    }
  }

  boot_diagnostics {
    enabled = "true"
    storage_uri = "${azurerm_storage_account.diagstorageaccount.primary_blob_endpoint}"
  }

  tags {
    environment = "demo"
    ProjectId = "PuppetEnterpriseDemo"
  }
}
