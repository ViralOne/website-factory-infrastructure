resource "aws_iam_policy" "bucket_policy" {
  name        = "s3-wf-access"
  path        = "/"
  description = "Allow access to S3 for Workflow"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject",
          "s3:GetBucketPolicy",
          "s3:PutBucketPolicy"
        ],
        "Resource" : [
          "arn:aws:s3:::*/*",
          "arn:aws:s3:::${local.bucket.name}"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "s3_access" {
  name = "website-factory_s3_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "wf_bucket_policy" {
  role       = aws_iam_role.s3_access.name
  policy_arn = aws_iam_policy.bucket_policy.arn
}

resource "aws_iam_instance_profile" "wf_profile" {
  name = "website-factory-profile"
  role = aws_iam_role.s3_access.name
}
