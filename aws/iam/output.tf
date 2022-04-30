output "iam_role_arn" {
  value = resource.aws_iam_role.s3_access.arn
}

output "iam_role_create_date" {
  value = resource.aws_iam_role.s3_access.create_date
}

output "iam_role_name" {
  value = resource.aws_iam_role.s3_access.name
}

output "iam_role_id" {
  value = resource.aws_iam_role.s3_access.id
}

output "iam_role_unique_id" {
  value = resource.aws_iam_role.s3_access.unique_id
}