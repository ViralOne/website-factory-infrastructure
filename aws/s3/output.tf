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

output "iam_policy_name" {
  value = resource.aws_iam_policy.bucket_policy.name
}

output "iam_policy_id" {
  value = resource.aws_iam_policy.bucket_policy.id
}

output "iam_policy_arn" {
  value = resource.aws_iam_policy.bucket_policy.arn
}

output "iam_role_policy_attachment_id" {
  value = resource.aws_iam_role_policy_attachment.wf_bucket_policy.id
}

output "iam_instance_profile_name" {
  value = resource.aws_iam_instance_profile.wf_profile.name
}

output "iam_instance_profile_id" {
  value = resource.aws_iam_instance_profile.wf_profile.id
}

output "iam_instance_profile_arn" {
  value = resource.aws_iam_instance_profile.wf_profile.arn
}
