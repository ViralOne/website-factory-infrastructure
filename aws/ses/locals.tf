locals {
  aws_region = {
    description = "Default AWS region"
    default     = "eu-central-1"
  }

  ses = {
    enabled       = true
    domain        = "example.com" # change this
    environment   = "dev"
    namespace     = "dev"
    zone_id       = ""
    verify_dkim   = true
    verify_domain = true
  }
}
