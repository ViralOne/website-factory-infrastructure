# aws_s3_bucket_policy.website-factory:
resource "aws_s3_bucket_policy" "website-factory" {
  bucket   = "website-factory"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject",
            "s3:ListMultipartUploadParts",
          ]
          Effect = "Allow"
          Principal = {
            Service = "s3.amazonaws.com",
          }
          Resource = [
            "arn:aws:s3:::website-factory",
            "arn:aws:s3:::website-factory/*",
          ]
        }
      ]
      Version = "2012-10-17"
    }
  )
}
