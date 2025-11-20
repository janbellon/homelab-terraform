# Proxmox
variable "proxmox_node" {
    type    = string
    default = "pve"
}

variable "proxmox_vm_storage" {
    type    = string
    default = "local-lvm"
}

# Network
variable "network_prefix" {
    type    = string
    default = "10.0"
}

variable "network_domain" {
    type    = string
    default = "network.lan"
}

variable "nameserver" {
    type    = string
    default = "1.1.1.1"
}

# Host variables
variable "db" {
    description = "Database VM settings"
    type = map(object({
        hostname    : string
        vlan        : number
        vlan_cidr   : number
        vmid        : number
        disk_size   : string
        ciuser      : string
        cipassword  : string
        sshkeys     : string
    }))
}









