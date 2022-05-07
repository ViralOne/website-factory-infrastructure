resource "aws_db_instance" "postgres_db" {
  allocated_storage   = local.allocated_storage.default
  engine              = local.engine.default
  identifier          = local.identifier.default
  engine_version      = local.engine_version.default
  instance_class      = local.instance_class.default
  name                = local.name.default
  username            = local.username.default
  password            = random_password.password.result
  skip_final_snapshot = local.skip_final_snapshot.default
  publicly_accessible = local.publicly_accessible.default

  backup_retention_period = local.backup.backup_retention_period
  backup_window = local.backup.backup_window
}

resource "random_password" "password" {
  length           = local.random.length
  special          = local.random.special
  override_special = local.random.override_special
}
