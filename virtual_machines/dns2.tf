module "dns2" {
    source = "../modules/virtual_machine"

    #------ Global VM informations ------#

    name            = "dns2"
    vmid            = 100011
    image           = "ubuntu-24.04"

    netbox_role     = "coredns"

    tags            = ["prod"]

    # node            = "pve-r821"
    # netbox_cluster  = "pve-r821"

    # startup_order   = 0

    #------ Hardware ------#

    cores       = 2
    memory      = 2048  # In MB
    disk_size   = 10    # In GB

    # storage_volume = "VM"

    #------ Network ------#

    ip          = "10.27.100.11"

    # gateway     = "10.27.100.254"
    # netmask     = "23"
    # network_bridge = "vmbr100"
    # zone            = "enpos.lan"
    # dns_domain  = "enpos.lan"
    # dns_servers = ["10.27.100.10","10.27.100.11"]
}