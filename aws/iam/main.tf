resource "aws_iam_role" "s3_access" {
  name = "s3-wf-access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["sts:AssumeRole"]
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

/*
resource "aws_iam_role" "s3_access" {
  name = "s3-wf-access"

  s3e_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
         "s3:DeleteObject",
         "s3:DeleteObjectVersion",
         "s3:GetAccelerateConfiguration",
         "s3:GetBucketAcl",
         "s3:GetBucketCORS",
         "s3:GetBucketLogging",
         "s3:GetBucketObjectLockConfiguration",
         "s3:GetBucketOwnershipControls",
         "s3:GetBucketRequestPayment",
         "s3:GetBucketTagging",
         "s3:GetBucketVersioning",
         "s3:GetBucketWebsite",
         "s3:GetObject",
         "s3:GetObjectTagging",
         "s3:GetObjectVersion",
         "s3:PutObject",
         "s3:PutObjectTagging"]
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
*/