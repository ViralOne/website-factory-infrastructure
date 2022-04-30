resource "aws_s3_bucket" "website-factory" {
  bucket        = local.bucket.name
  force_destroy = local.bucket.force_destroy
  acl           = local.bucket.acl

  tags = {
    Name           = local.bucket.name
    Classification = "Public"
  }
  
  versioning {
    enabled    = local.bucket.versioning
    mfa_delete = local.bucket.mfa_delete
  }
}