terraform {
  required_version = ">= 1.2.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.87.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "5.5.0"
    }
    netbox = {
      source  = "rypti-org/netbox"
      version = "5.0.0"
    }
    powerdns = {
      source = "pan-net/powerdns"
      version = "1.5.0"
    }
  }

  backend "http" { 
    address        = "https://gitlab.nobell.fr/api/v4/projects/2/terraform/state/nobell"
    lock_address   = "https://gitlab.nobell.fr/api/v4/projects/2/terraform/state/nobell/lock"
    unlock_address = "https://gitlab.nobell.fr/api/v4/projects/2/terraform/state/nobell/lock"
    username       = "terraform"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = 5
    skip_cert_verification = true
  }

}
