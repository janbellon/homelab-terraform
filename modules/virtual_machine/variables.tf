variable "name" {
  type = string
}

variable "image" {
  type = string
  default = "ubuntu-2204.img"
}

variable "node" {
  type = string
  default = "pve-r821"
}

variable "vmid" {
  type    = number
  default = null
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory" {
  type    = number
  default = 2048
}

variable "disk_size" {
  type    = number
  default = 16
}

variable "ip" {
  type = string
  default = "dhcp"
}

variable "gateway" {
  type    = string
  default = "10.27.100.254"
}

variable "dns_servers" {
  type    = list(string)
  default = ["10.17.100.10", "10.27.100.11"]
}

variable "dns_domain" {
  type    = string
  default = "enpos.lan"
}

variable "netmask" {
  type    = string
  default = "23"
}

variable "network_bridge" {
    type    = string
    default = "vmbr100"
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "cloud_user" {
  type    = string
  default = "root"
}

variable "ssh_keys" {
  type    = list(string)
  default = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKjw7m9mIDGHYuq0QRK3/i0iaEQ5hQGkM5VWM1hFPPbw"
  ]
}

variable "netbox_cluster" {
  type    = string
  default = "pve-r821"
}

variable "netbox_role" {
  type    = string
}

variable "zone" {
  type    = string
  default = "enpos.lan"
}

variable "storage_volume" {
  type    = string
  default = "VM"
}