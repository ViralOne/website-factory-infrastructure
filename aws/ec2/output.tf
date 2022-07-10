output "ec2_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_instance.id
}

output "ec2_arn" {
  description = "List of IDs of t2-type instances"
  value       = module.ec2_instance.arn
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = module.ec2_instance.public_dns
}

output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.ec2_instance.public_dns
}

output "instange_public_ip" {
  description = "Public IP address assigned to the EC2 instance"
  value       = module.ec2_instance.public_ip
}

output "instance_state" {
  description = "State of the EC2 instance"
  value       = module.ec2_instance.instance_state
}

output "exposed_ports" {
  description = "List of exposed ports"
  value       = resource.aws_security_group.expose_web.ingress
}

output "domain-public-zone-id" {
  value = aws_route53_zone.zone.zone_id
}

output "domain-name-servers" {
  value = aws_route53_zone.zone.name_servers
}

output "key_pair_fingerprint" {
  value       = resource.aws_key_pair.wf_pair_key.fingerprint
  description = "Key pair fingerprint"
}

output "key_pair_name" {
  value       = resource.aws_key_pair.wf_pair_key.key_name
  description = "Key pair name"
}

output "key_pair_id" {
  value       = resource.aws_key_pair.wf_pair_key.key_pair_id
  description = "Key pair ID"
}

output "rds_cluster_arn" {
  value = resource.aws_db_instance.postgres_db.arn
}

output "rds_cluster_id" {
  value = resource.aws_db_instance.postgres_db.id
}

output "rds_cluster_resource_id" {
  value = resource.aws_db_instance.postgres_db.resource_id
}

output "rds_cluster_endpoint" {
  value = resource.aws_db_instance.postgres_db.endpoint
}

output "this_rds_cluster_port" {
  value = resource.aws_db_instance.postgres_db.port
}

output "rds_cluster_master_password" {
  value     = resource.aws_db_instance.postgres_db.password
  sensitive = true
}

output "rds_cluster_master_username" {
  value = resource.aws_db_instance.postgres_db.username
}

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
  value = resource.aws_iam_role_policy_attachment.bucket_policy.id
}

output "iam_instance_profile_name" {
  value = resource.aws_iam_instance_profile.profile.name
}

output "iam_instance_profile_id" {
  value = resource.aws_iam_instance_profile.profile.id
}

output "iam_instance_profile_arn" {
  value = resource.aws_iam_instance_profile.profile.arn
}
