locals {
  aws_region = {
    description = "Default AWS region"
    default     = "eu-central-1"
  }

  instance_class = {
    description = "EC2 instance type"
    default     = "db.t2.micro"
  }

  allocated_storage = {
    description = "RDS allocated storage"
    default     = "20"
  }

  engine = {
    description = "RDS engine"
    default     = "postgres"
  }

  identifier = {
    description = "RDS identifier"
    default     = "dev-db"
  }

  engine_version = {
    description = "RDS engine version"
    default     = "13"
  }

  name = {
    description = "RDS name"
    default     = "website-factroy-db"
  }

  username = {
    description = "RDS username"
    default     = "ufadmin"
  }

  skip_final_snapshot = {
    description = "RDS skip final snapshot"
    default     = true
  }

  publicly_accessible = {
    description = "RDS public access"
    default     = true
  }

  random = {
    length           = "20" # password length
    special          = false
    override_special = "_%@"
  }
}
