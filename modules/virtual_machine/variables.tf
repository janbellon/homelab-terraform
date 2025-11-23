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
  default = ["10.27.100.1", "1.1.1.1"]
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
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCYt5J+Qd7WY80XMBP/NQMzfEZqpu3V53Zm0fI7cWWY7Pjaqn3vG0VepU01KP/V6Qg6tdRZUgyKImrYMcFFxG5GREBmNqw6NnzYiZSw/Vut7CecqsoUvlkvU6fuKtMv1+onWn2o9W3+H1t6scBxOz2RT+tve7rBirtH43ObKs3FgViNLTO9ZS/evXno8vZ/fSP8liARL0ERH2WuPBsSe675/lAt/VowByoh2XNztsgKmkkGdEJzZdHsyr3ms9KLS9p9TCRwnJxwzxLph2ymM0L9Rf/BiuOg5sumkYqz5WJNdp+80RD1xazv5gp3koNxNGse1dBNhz25kbohIgbwMfWkyH7UaUJ9DrqXL3lvDaTyA0Hy0kBIiHrhYa1K/VqjxLic/gXEEiwp9A/g6zSWNDtjy6N0HgicmbhoxMeft0fX84eNFOTLx2kghCyV2w58bdwmHh26j553u91T6IbiR3eyRU+VJqrYLs+/GQUACbQIUrUKhBt5Coz9vDbsZSMib5GjpnAFAwHx0Cp0+AUXliPlSUz4UmZNf6trqHCW8DoJ39mscKLTo4r5WhnjxpkYhOjGUXu2LKNdqx3Of3ALfTCNPU4xY12PoDZ2Gxs7neOOckmyvW9f+qg7JkuPYsT1SgzHhB8J5dy5151zwl1VtO8YrzmDcNDhbN+uBYoUog2Wvw=="
  ]
}

variable "netbox_cluster" {
  type    = string
  default = "pve_r821"
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

variable "startup_order" {
  type    = number
  default = 0
}