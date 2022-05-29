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

  app_image = {
    description = "Docker image to run in the ECS cluster"
    default     = "code4romania/website-factory:edge"
  }

  app_port = {
    description = "Port exposed by the docker image to redirect traffic to"
    default     = 80
  }

  app_count = {
    description = "Number of docker containers to run"
    default     = 1
  }

  health_check_path = {
    default = "/"
  }

  fargate_cpu = {
    description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
    default     = "256"
  }

  fargate_memory = {
    description = "Fargate instance memory to provision (in MiB)"
    default     = "512"
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
