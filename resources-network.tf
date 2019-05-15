data "azurerm_virtual_network" "myvnet" {
  name                = "${var.myvnet}"
  resource_group_name = "${data.azurerm_resource_group.rg_mygroup.name}"
}

resource "azurerm_subnet" "net1" {
  name                 = "net1"
  resource_group_name  = "${data.azurerm_resource_group.rg_mygroup.name}"
  virtual_network_name = "${data.azurerm_virtual_network.myvnet.name}"
  address_prefix       = "172.31.0.192/26"
}

resource "azurerm_subnet" "net2" {
  name                 = "net1"
  resource_group_name  = "${data.azurerm_resource_group.rg_mygroup.name}"
  virtual_network_name = "${data.azurerm_virtual_network.myvnet.name}"
  address_prefix       = "172.31.0.64/26"
}
