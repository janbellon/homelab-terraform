terraform {
  required_version = ">= 1.2.0"
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.87.0"
    }
    vault = {
      source  = "hashicorp/vault"
    }
    netbox = {
      source  = "rypti-org/netbox"
    }
    random = {
      source  = "hashicorp/random"
    }
  }
}
