#!/usr/bin/env bash
set -euo pipefail

if [ -z "${1-}" ]; then
	echo "Usage: $0 <module_name>"
	exit 2
fi

read -r -p "Are you shure you want to destroy VM '$1'? Type 'yes' to continue: " confirm
if [ "$confirm" != "yes" ]; then
	echo "Aborting. No changes made."
	exit 0
fi

terraform destroy -target=module.$1.data.netbox_cluster.nb_cluster -auto-approve
terraform destroy -target=module.$1.data.netbox_device_role.nb_role -auto-approve
terraform destroy -target=module.$1.data.vault_generic_secret.terraform_secrets -auto-approve
terraform destroy -target=module.$1.netbox_interface.vm_int -auto-approve
terraform destroy -target=module.$1.netbox_ip_address.vm_ip -auto-approve
terraform destroy -target=module.$1.netbox_virtual_machine.nb_vm -auto-approve
terraform destroy -target=module.$1.proxmox_virtual_environment_vm.vm -auto-approve

#!/usr/bin/env bash
set -euo pipefail

if [ -z "${1-}" ]; then
	echo "Usage: $0 <module_name>"
	exit 2
fi

read -r -p "Do you want to remove associated .tf file ? '$1'? Type 'yes' to continue: " confirm
if [ "$confirm" != "yes" ]; then
	echo "File keeped !"
	exit 0
fi

rm "$1.tf"