# Providers configuration
# Vault token is provided via variable `vault_token` (from TF_VAR_vault_token env var)

variable "vault_addr" {
  type    = string
  default = "https://openbao.enpos.lan"
}

variable "vault_token" {
  type      = string
  sensitive = true
  default   = null
}

provider "vault" {
  address = var.vault_addr
}

# Read Terraform secrets from Vault KV (assumes KV v2 mounted at kv/)
data "vault_generic_secret" "terraform_secrets" {
  path = "kv/terraform"
}

locals {
  proxmox_api_token_id  = lookup(data.vault_generic_secret.terraform_secrets.data, "proxmox_api_key_id", "")
  proxmox_api_token     = lookup(data.vault_generic_secret.terraform_secrets.data, "proxmox_api_key", "")
  netbox_api_token      = lookup(data.vault_generic_secret.terraform_secrets.data, "netbox_api_key", "")
  ssh_private_key       = lookup(data.vault_generic_secret.terraform_secrets.data, "ssh_privkey", "")
}

# Proxmox provider uses token read from Vault
variable "proxmox_url" {
  type    = string
  default = "https://pve.infra.enpos.lan:8006/"
}

provider "proxmox" {
  endpoint   = var.proxmox_url
  api_token = "${local.proxmox_api_token_id}=${local.proxmox_api_token }"
  insecure     = true
  ssh {
    agent = true
    username = "root"
    private_key = local.ssh_private_key
  }
}

# NetBox provider uses token read from Vault
variable "netbox_url" {
  type    = string
  default = "https://netbox.enpos.lan"
}

provider "netbox" {
  server_url   = var.netbox_url
  api_token = local.netbox_api_token
}
