data "azurerm_resource_group" "rg_mygroup" {
  name = "${var.myrg}"
}

resource "azurerm_network_security_group" "sg-linuxin" {
  name                = "sg-linuxin"
  location            = "${var.az_location}"
  resource_group_name = "${data.azurerm_resource_group.rg_mygroup.name}"

  security_rule {
    name                       = "ALL"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "172.16.0.0/12"
    destination_address_prefix = "*"
  }

  tags {
    environment = "demo"
  }
}
