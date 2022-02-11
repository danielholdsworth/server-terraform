terraform {
  required_providers {
    aws = {
      version = "4.0.0"
      source  = "hashicorp/aws"
    }
    cloudinit = {
      version = "2.2.0"
      source  = "hashicorp/cloudinit"
    }
  }
}
