module "acme-test" {
    source = "../modules/virtual_machine"

    #------ Global VM informations ------#

    name            = "acme-test"
    vmid            = 120100
    image           = "ubuntu-24.04"
    netbox_role     = "step_ca"

    tags            = ["prod", "ssl"]

    # node            = "pve-r821"
    # netbox_cluster  = "pve-r821"

    # startup_order   = 0

    #------ Hardware ------#

    cores       = 2
    memory      = 2048  # In MB
    disk_size   = 10    # In GB

    # storage_volume = "VM"

    #------ Network ------#

    ip          = "10.27.120.100"

    gateway     = "10.27.120.254"
    # netmask     = "23"
    network_bridge = "vmbr120"
    # zone            = "enpos.lan"
    # dns_domain  = "enpos.lan"
    # dns_servers = ["10.27.100.10","10.27.100.11"]
}