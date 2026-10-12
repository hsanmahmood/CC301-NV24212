terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

module "monday" {
  source = "./modules/note"
  day    = "monday"
}

module "tuesday" {
  source = "./modules/note"
  day    = "tuesday"
}


