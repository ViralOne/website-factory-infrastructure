locals {
  aws_region = {
    description = "Default AWS region"
    default     = "eu-central-1"
  }

  bucket = {
    description   = "Bucket details"
    name          = "websitefactory-bucket" # change this to your bucket name
    acl           = "public-read"
    force_destroy = false
    versioning    = true
    mfa_delete    = false
  }
}
