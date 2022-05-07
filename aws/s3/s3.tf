resource "aws_s3_bucket" "website-factory" {
  bucket        = local.bucket.name
  force_destroy = local.bucket.force_destroy
  acl           = local.bucket.acl

  tags = {
    Name           = local.bucket.name
    Classification = "Public"
  }
}

resource "aws_s3_bucket_versioning" "website-factory" {
  bucket = aws_s3_bucket.website-factory.id

  versioning_configuration {
    status = local.bucket.versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "website-factory" {
  bucket = aws_s3_bucket.website-factory.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = local.bucket.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "website-factory" {
  bucket = aws_s3_bucket.website-factory.id

  rule {
    status = "Enabled"
    id     = "noncurrent_transition"

    abort_incomplete_multipart_upload {
      days_after_initiation = local.bucket.days_after_initiation
    }

    noncurrent_version_transition {
      noncurrent_days = local.bucket.version_transition_days
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_expiration {
      noncurrent_days = local.bucket.version_expiration_days
    }
  }
}
