resource "azurerm_network_interface" "myterraformnic" {
  name                      = "nic-${count.index}"
  count                     = "${var.vmcount}"
  location                  = "${var.az_location}"
  resource_group_name       = "${data.azurerm_resource_group.rg_mygroup.name}"
  network_security_group_id = "${azurerm_network_security_group.sg-linuxin.id}"

  ip_configuration {
    name                          = "myNicConfiguration-sn1"
    subnet_id                     = "${azurerm_subnet.net1.id}"
    private_ip_address_allocation = "Dynamic"

    #        public_ip_address_id          = "${azurerm_public_ip.myterraformpublicip.id}"
  }
}

resource "azurerm_virtual_machine" "server" {
  name                  = "server-${count.index}"
  count                 = "${var.vmcount}"
  location              = "${var.az_location}"
  resource_group_name   = "${data.azurerm_resource_group.rg_mygroup.name}"
  network_interface_ids = ["${element(azurerm_network_interface.myterraformnic.*.id, count.index)}"]
  vm_size               = "${var.vm_size}"

  storage_os_disk {
    name              = "server-${count.index}-os"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "40"
  }

  storage_data_disk {
    name              = "server-${count.index}-data"
    caching           = "ReadWrite"
    create_option     = "Empty"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "80"
    lun               = "2"
  }

  storage_image_reference {
    publisher = "Openlogic"
    offer     = "CentOS"
    sku       = "7.6"
    version   = "latest"
  }

  os_profile {
    computer_name  = "server-${count.index}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false

    ssh_keys {
      key_data = "${file("~/.ssh/id_rsa.pub")}"
      path     = "~/.ssh/authorized_keys"
    }
  }
}
