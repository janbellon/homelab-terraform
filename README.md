# Enpos Terraform Repository

**Quick start**
1. Clone the repository
```bash
git clone https://gitlab.enpos.fr/enpos/admin/terraform/proxmox terraform
cd terraform
```
If you have already cloned the repository, you can pull the latest changes
```bash
git pull origin main
```
2. Edit, delete or add VMs to `virtual_machines.yaml`
3. Apply changes
```bash
export VAULT_TOKEN=<TERRAFORM-VAULT-TOKEN> # Stored in Bitwarden
```
Get THe Gitlab Access Token stored in vault (should output something like `glpat-XX...`)
```bash
export GITLAB_ACCESS_TOKEN=$(vault kv get -field gitlab_access_token -address https://vault.nobell.lan kv/terraform)
echo ${GITLAB_ACCESS_TOKEN:0:8}...
```

If running for the first time...
```bash
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

**Setting up the Terraform token on Vault/OpenBao**

```bash
export VAULT_TOKEN=s.yourtoken
export VAULT_ADDR=https://vault.nobell.lan
vault login s.yourtoken
vault policy write terraform terraform-policy.hcl
vault token create -policy="terraform" -ttl=8760
```

**More Informations**
Netbox roles map
- 1  : authentik
- 2  : kea_dhcp
- 3  : coredns
- 4  : postfix
- 5  : openvpn
- 6  : freeradius
- 7  : asterisk
- 8  : step_ca
- 9  : generic (default)
- 10 : outline
- 11 : nginx
- 12 : powerdns
- 13 : vault
- 14 : gitlab
- 15 : k8s
- 16 : grafana
- 17 : smtp_relay

Available images
- ubuntu-24.04
- ubuntu22-04
- debian-13
- fedora-coreos-43
- flatcar-44
- rocky-10
- centos-10
- almalinux-10
- arch