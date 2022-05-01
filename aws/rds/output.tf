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