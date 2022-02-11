terraform {
  required_version = "~>0.15.4"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

module "nomad_clients" {
  # We strongly recommend pinning the version using ref=<<release tag>> as is done here
  source = "git::https://github.com/CircleCI-Public/server-terraform.git//nomad-aws?ref=3.1.0"

  # Number of nomad clients to run
  nodes = 4

  subnet = "the_subnets_in_your_vpc"
  vpc_id = "vpc-083cac839886a9fcc"

  server_endpoint = "acb1865e97e814f908fbb15be650174f-cc428fa3c0407df8.elb.eu-west-2.amazonaws.com:4647"

  dns_server = "10.0.0.2"
  blocked_cidrs = [
    ""
  ]

  instance_tags = {
    "vendor" = "circleci"
    "team"   = "dan_holdsworth"
  }

}

output "nomad_server_cert" {
  value = module.nomad_clients.nomad_server_cert
}

output "nomad_server_key" {
  value = module.nomad_clients.nomad_server_key
}

output "nomad_ca" {
  value = module.nomad_clients.nomad_tls_ca
}