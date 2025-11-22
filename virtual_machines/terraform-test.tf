module "terraform-test" {
    source = "../modules/virtual_machine"

    #------ Global VM informations ------#

    name            = "terraform-test"
    vmid            = 100126
    image           = "ubuntu-24.04"
    netbox_role     = "authentik"

    tags            = ["prod", "ssl"]

    # ssh_keys    = ["ssh-ed25519 AAAA..."]

    # node            = "pve-r821"
    # netbox_cluster  = "pve-r821"

    # startup_order   = 0

    #------ Hardware ------#

    cores       = 4
    memory      = 8192  # In MB
    disk_size   = 10    # In GB

    # storage_volume = "VM"

    #------ Network ------#

    ip          = "10.27.100.126"

    # gateway     = "10.27.100.254"
    # netmask     = "23"
    # network_bridge = "vmbr100"
    # zone            = "enpos.lan"
    # dns_domain  = "enpos.lan"
    # dns_servers = ["10.27.100.10","10.27.100.11"]
}