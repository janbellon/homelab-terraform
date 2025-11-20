packer {
    required_plugins {
        proxmox = {
            version = "=> 1"
            source  = "github.com/hashicorp/proxmox"
        }
    }
}

source  "proxmox-iso" "ubuntu-22-04" {

    # Proxmox configuration
    proxmox_url                 = var.proxmox_api_url
    insecure_skip_tls_verify    = true
    username                    = var.proxmox_api_token_id
    token                       = var.proxmox_api_token_secret
    node                        = var.proxmox_node

    boot_iso {
        type = "scsi"
        iso_file = "local:iso/ubuntu-server-22.04.iso"
        unmount = true
        iso_checksum = ""
    }

}