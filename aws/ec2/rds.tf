resource "aws_db_instance" "postgres_db" {
  allocated_storage   = local.rds.allocated_storage
  engine              = local.rds.engine
  identifier          = local.rds.identifier
  engine_version      = local.rds.engine_version
  instance_class      = local.rds.instance_class
  db_name             = local.rds.name
  username            = local.rds.username
  password            = random_password.password.result
  skip_final_snapshot = local.rds.skip_final_snapshot
  publicly_accessible = local.rds.publicly_accessible

  backup_retention_period = local.rds.backup.retention_period
  backup_window           = local.rds.backup.window
}

resource "random_password" "password" {
  length           = local.rds.random.length
  special          = local.rds.random.special
  override_special = local.rds.random.override_special
}
