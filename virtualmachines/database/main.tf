resource "proxmox_vm_qemu" "database" {
    name        = var.db.hostname
    target_node = var.proxmox_node
    clone       = "ubuntu-2404-template"
    storage     = var.proxmox_vm_storage
    vmid        = tonumber("${var.db.vlan}${var.db.vmid}")
    tags        = "postgresql"
    os_type     = "cloud-init"

    # Cloud init options
    ciuser      = var.db.ciuser
    cipassword  = var.db.cipassword
    nameserver  = var.nameserver
    sshkeys     = var.db.sshkeys
    ipconfig0   = "ip=${var.network_prefix}.${var.db.vlan}.${var.db.vmid}/${var.db.vlan_cidr},gw=${var.network_prefix}.${var.db.vlan}.254"
    searchdomain    = var.network_domain

    # Ressources
    cores       = var.db.cores
    memory      = var.db.memory
    disk {
        slot        = "scsi0"
        disk_file   = "${var.proxmox_vm_storage}:${var.db.vlan}${var.db.vmid}-disk-0"
        size        = var.db.disk_size
    }
}