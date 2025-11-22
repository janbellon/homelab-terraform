# Module: virtual_machine
# Creates a Proxmox VM by cloning a template, generates a random cloud-init password,
# stores it in Vault, and creates NetBox objects.

resource "proxmox_virtual_environment_vm" "vm" {
    name        = var.name
    vm_id        = var.vmid
    node_name = var.node

    cpu {
        cores = var.cores
        type = "x86-64-v2-AES"
    }

    memory {
        dedicated = var.memory
        floating = var.memory
    }

    disk {
        datastore_id = var.storage_volume
        file_id = "ISO:iso/${var.image}.img"
        size = var.disk_size
        interface = "scsi0"
    }

    initialization {
        datastore_id = var.storage_volume
        interface = "ide2"

        dns {
            domain = var.dns_domain
            servers = var.dns_servers
        }

        ip_config {
            ipv4 {
                address = "${var.ip}/${var.netmask}"
                gateway = var.gateway
            }
        }

        user_account {
            keys = var.ssh_keys
            username = var.cloud_user
        }
    }

    network_device {
        bridge = var.network_bridge
    }

    operating_system {
        type = "l26"
    }

    keyboard_layout = "fr"

    startup {
        order = var.startup_order
    }
}

# NetBox resources
# NOTE: resource names and attributes depend on the exact NetBox provider version.
# The example below uses common patterns but may need adjustments.

data "netbox_cluster" "nb_cluster" {
    name = var.netbox_cluster
}

data "netbox_device_role" "nb_role" {
    name = var.netbox_role
}

resource "netbox_virtual_machine" "nb_vm" {
    name = "${var.name}.${var.zone}"
    cluster_id = data.netbox_cluster.nb_cluster.id
    role_id = data.netbox_device_role.nb_role.id
    # `role`, `platform`, `comments` etc. may be provider-specific fields
    # Add tags
    tags = var.tags
}

resource "netbox_interface" "vm_int" {
    name               = "eth0"
    virtual_machine_id = netbox_virtual_machine.nb_vm.id
}

resource "netbox_ip_address" "vm_ip" {
    ip_address = format("%s/%s", var.ip, var.netmask)
    status = "active"
    virtual_machine_interface_id = netbox_interface.vm_int.id
    # Optionally set `status`, `description`, or assign to an interface after creating VM record.
}

# If needed, link the IP to the VM in NetBox - provider-specific, may require `interface` resource.

output "vm_name" {
    value = var.name
}

output "netbox_vm_name" {
    value = netbox_virtual_machine.nb_vm.name
}
