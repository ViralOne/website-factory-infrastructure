locals {
  aws_region = {
    description = "Default AWS region"
    default     = "eu-central-1"
  }

  bucket = {
    description             = "Bucket details"
    name                    = "websitefactory-bucket" # change this to your bucket name
    acl                     = "public-read"
    force_destroy           = false
    versioning              = "Enabled"
    sse_algorithm           = "AES256"
    days_after_initiation   = 7
    version_transition_days = 7
    version_expiration_days = 30
  }
}
