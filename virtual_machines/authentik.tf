# Root module
# This repo follows the pattern: each VM has its own file in `virtual_machines/` which instantiates the `modules/virtual_machine` module.
# No top-level resource declared here.

module "authentik" {
    source = "../modules/virtual_machine"

    #------ Global VM informations ------#

    name            = "authentik"
    vmid            = 100012
    image           = "ubuntu-2204.img"
    netbox_role     = "authentik"

    tags            = ["prod", "ssl"]

    # ssh_keys    = ["ssh-ed25519 AAAA..."]

    # node            = "pve-r821"
    # netbox_cluster  = "pve-r821"

    #------ Hardware ------#

    cores       = 4
    memory      = 8192  # In MB
    disk_size   = 10    # In GB

    # storage_volume = "VM"

    #------ Network ------#

    ip          = "10.27.100.12"

    # gateway     = "10.27.100.254"
    # netmask     = "23"
    # network_bridge = "vmbr100"
    # zone            = "enpos.lan"
    # dns_domain  = "enpos.lan"
    # dns_servers = ["10.27.100.10","10.27.100.11"]
}