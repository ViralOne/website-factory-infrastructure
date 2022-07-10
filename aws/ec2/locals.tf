locals {
  tags = {
    env       = "dev"
    org_name  = "websitefactory"
    Terraform = "true"
  }

  aws_region = {
    description = "Default AWS region"
    default     = "eu-central-1"
  }

  ec2 = {
    key_name      = format("%s-%s", "key", local.tags.org_name)
    instance_type = "t2.micro"
    ami           = "ami-015c25ad8763b2f11"
    iam_profile   = "website-factory-profile"
    ses = {
      enabled = true
      domain  = "c4r.com"     # change this
      email   = "ngo@c4r.com" # change this
    }
  }

  rds = {
    instance_class      = "db.t3.micro"
    allocated_storage   = "20"
    engine              = "postgres"
    identifier          = format("%s-%s", "db", local.tags.org_name)
    engine_version      = "13.4"
    name                = format("%s%s", "db", local.tags.org_name)
    username            = "ufadmin"
    skip_final_snapshot = true
    publicly_accessible = true
    random = {
      length           = "20" # password length
      special          = false
      override_special = "_%@"
    }
    backup = {
      retention_period = "7"
      window           = "12:00-01:30" #UTC timezone converted to UTC +2 results (02:00-03:30) Buchanan timezone
    }
  }

  bucket = {
    description             = "Bucket details"
    name                    = format("%s-%s", "bucket", local.tags.org_name)
    acl                     = "public-read"
    force_destroy           = false
    versioning              = "Enabled"
    sse_algorithm           = "AES256"
    days_after_initiation   = 7
    version_transition_days = 7
    version_expiration_days = 30
  }
}
