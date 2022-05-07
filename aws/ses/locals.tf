locals {
  aws_region = {
    description = "Default AWS region"
    default     = "eu-central-1"
  }

  ses = {
    enabled = true
    domain  = "c4r.com"     # change this
    email   = "ngo@c4r.com" # change this
  }
}
