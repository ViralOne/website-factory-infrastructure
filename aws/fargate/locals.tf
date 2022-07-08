locals {
  aws_region = {
    description = "Default AWS region"
    default     = "eu-central-1"
  }

  key_name = {
    description = " SSH keys to connect to EC2 instance"
    default     = "wf-key-1"
  }

  ecs_task_execution_role_name = {
    description = "ECS task execution role name"
    default = "website-factory-ecs-role"
  }

  az_count = {
    description = "Number of AZs to cover in a given region"
    default     = "1"
  }

  app = {
    image = "code42/website-factory:edge"
    port  = 80
    count = 1
    health_check = "/"
  }

  fargate = {
    cpu    = "256"
    memory = "512"
  }

  redis = {
    cluster_id = "redis-cluster"
    engine = "redis"
    node_type = "cache.t3.micro"
    num_cache_nodes = 1
    parameter_group_name = "default.redis3.2"
    engine_version = "3.2.10"
    port = 6379
  }

  iam_profile = {
    description = "IAM instance profile"
    default     = "website-factory-profile"
  }

  ses = {
    enabled = true
    domain  = "c4r.com"     # change this
    email   = "ngo@c4r.com" # change this
  }

  domain = {
    record_A = "server.domain-registration.com" # change this
  }
}
