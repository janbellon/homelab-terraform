output "vm_id" {
  value = proxmox_virtual_environment_vm.vm.id
}

output "netbox_vm" {
  value = netbox_virtual_machine.nb_vm.id
}