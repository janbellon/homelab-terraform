terraform {
  backend "http" { 
    address        = "https://gitlab.enpos.fr/api/v4/projects/37/terraform/state/enpos-prod"
    lock_address   = "https://gitlab.enpos.fr/api/v4/projects/37/terraform/state/enpos-prod/lock"
    unlock_address = "https://gitlab.enpos.fr/api/v4/projects/37/terraform/state/enpos-prod/lock"
    username       = "terraform"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = 5
  }
}