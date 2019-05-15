variable "az_location" {}

variable "vmcount" {
  default = 20
}

variable "vm_size" { default = "Standard_A4_v2"}

variable "myvnet" {}
variable "myrg" {}
variable "admin_username" {}

variable "admin_password" {}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
