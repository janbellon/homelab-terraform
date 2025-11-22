# terraform-copilot

Terraform repo scaffold to provision VMs on Proxmox, register them in NetBox and store secrets in Vault.

**Overview**
- `modules/virtual_machine` - module that creates a VM from a Proxmox template (Cloud-Init), generates a random cloud-init password, writes it to Vault, and creates corresponding NetBox objects.
- `virtual_machines/*.tf` - one file per VM; each file instantiates the `virtual_machine` module with VM-specific variables.

**Secrets / Tokens**
- Proxmox and NetBox tokens are read from Vault at:
  - `kv/proxmox/api_keys -> data["terraform"]`
  - `kv/netbox/api_keys -> data["terraform"]`
- Per-VM cloud-init passwords are written to Vault at `kv/proxmox/virtual_machines/<vmname>/user_password`.
- Provide the Vault token to Terraform via environment variable `TF_VAR_vault_token` (or set it in a CI secret). Example:

```bash
export VAULT_TOKEN="s.xxxxxx"
```

**Quick start**
1. Clone the repository
2. Edit or add VM files in `virtual_machines/`
3. Apply changes
```bash
export VAULT_TOKEN=<TERRAFORM-VAULT-TOKEN>
```
```bash
export GITLAB_ACCESS_TOKEN=$(vault kv get -field gitlab_access_token -address https://openbao.enpos.lan kv/terraform)$
```
```bash
cd virtual_machines
terraform init -backend-config="password=$GITLAB_ACCESS_TOKEN"
```

Before applying the changes, check them
```bash
terraform plan
```

After verifying the changes, you can apply them
```bash
terraform apply
```

**Deleting virtual machines**
Check if ressources for the VM exist
```bash
cd virtual_machines
terraform state list
```

Destroy the ressources
```bash
./destroy.sh <vmname>
rm <vmname>.tf
```

4. Don't forget to push your changes
```bash
git add .
git commit -m "<Changes>"
git push origin main
```



**Notes**
- Provider resource names in the NetBox provider may need small adjustments depending on the provider version; comments in module point to where to adapt.
- This repo is a scaffold — test in a non-production environment first.

**Setting up the token on Vault/OpenBao**

```bash
export VAULT_TOKEN=s.yourtoken
export VAULT_ADDR=https://openbao.enpos.lan
vault login s.yourtoken
vault policy write terraform terraform-policy.hcl
vault token create -policy="terraform" -ttl=8760
```