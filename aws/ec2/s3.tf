resource "aws_s3_bucket" "data_s3" {
  bucket        = local.bucket.name
  force_destroy = local.bucket.force_destroy

  tags = {
    Name           = local.bucket.name
    Classification = "Public"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.data_s3.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "data_s3_policy" {
  bucket = aws_s3_bucket.data_s3.id

  versioning_configuration {
    status = local.bucket.versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "data_s3_encryption" {
  bucket = aws_s3_bucket.data_s3.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = local.bucket.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "data_s3_lifecycle" {
  bucket = aws_s3_bucket.data_s3.id

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
