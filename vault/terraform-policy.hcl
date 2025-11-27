path "kv/data/proxmox/virtual_machines/*" {
  capabilities = ["create", "update", "read", "delete", "list", "scan"]
}

path "kv/data/terraform" {
  capabilities = ["read"]
}

path "kv/data/powerdns" {
  capabilities = ["read"]
}

path "auth/token/create" {
  capabilities = ["create", "update", "read"]
}

path "auth/token/lookup-self" {
  capabilities = ["read"]
}