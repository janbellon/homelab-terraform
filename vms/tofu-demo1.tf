resource "proxmox_vm_qemu" "tofu_demo_1" {
    name = "tofu_demo_1"
    desc = "Ubuntu Server"
    vmid = "120055"
    target_node = "pve-r821"

    clone = "ubuntu-22.04"
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048

    network {
        bridge = "vmbr120"
        model = "virtio"
    }

    os_type = "cloud-init"
    ipconfig0 = "ip=10.27.120.55/23,gw=10.27.120.254"
    nameserver = "10.27.100.1"
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAg08cNf73VAFDWVOu0fMSIykTTU9tCZZ7ciAdeassQ8 jbellon&iliad-free.fr
    EOF
}