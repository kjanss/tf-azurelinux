variable "az_location" {}

variable "vmcount" {
  default = 20
}

variable "vm_size" {
  default = "Standard_A4_v2"
}

variable "subnets" {
  type = "map"

  default = {
    "net1" = "172.31.0.192/26"
    "net2" = "172.31.0.64/26"
  }
}

variable "allow_from" {
  default = "172.16.0.0/12"
}

variable "myvnet" {}
variable "myrg" {}
variable "admin_username" {}

variable "admin_password" {}

variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}
