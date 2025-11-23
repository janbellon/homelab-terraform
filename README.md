# Enpos Terraform Repository

**Quick start**
1. Clone the repository
```bash
git clone https://gitlab.enpos.fr/enpos/admin/terraform/proxmox
cd terraform
```
If you have already cloned the repository, you can pull the latest changes
```bash
git pull origin main
```
2. Edit or add VM files in `virtual_machines/`
3. Apply changes
```bash
export VAULT_TOKEN=<TERRAFORM-VAULT-TOKEN> # Stored in Bitwarden
```
Get THe Gitlab Access Token stored in vault (should output something like `glpat-XX...`)
```bash
export GITLAB_ACCESS_TOKEN=$(vault kv get -field gitlab_access_token -address https://openbao.enpos.lan kv/terraform)
echo ${GITLAB_ACCESS_TOKEN:0:8}...
```

If running for the first time...
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
1. Check if ressources for the VM exist
```bash
cd virtual_machines
terraform state list
```

2. Destroy the ressources
```bash
./destroy.sh <vmname>
rm <vmname>.tf
```

After finishing, dont forget to push your changes.
```bash
git add .
git commit -m "<Changes>"
git push origin main
```

**Setting up the Terraform token on Vault/OpenBao**

```bash
export VAULT_TOKEN=s.yourtoken
export VAULT_ADDR=https://openbao.enpos.lan
vault login s.yourtoken
vault policy write terraform terraform-policy.hcl
vault token create -policy="terraform" -ttl=8760
```