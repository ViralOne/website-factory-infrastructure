locals {
  tags = {
    env      = "dev"
    org_name = "websitefactory"
  }

  configs = {
    region   = "eu-central-1"
    az_count = 1
  }

  app = {
    image        = "code42/website-factory:edge"
    port         = 80
    count        = 1
    health_check = "/"
    launch_type  = "FARGATE"
  }

  fargate = {
    cpu    = "256"
    memory = "512"
  }

  redis = {
    cluster_id           = "redis-cluster"
    engine               = "redis"
    node_type            = "cache.t2.micro"
    num_cache_nodes      = 1
    parameter_group_name = "default.redis6.x"
    engine_version       = "6.2"
    port                 = 6379
  }

  network = {
    public_subnets  = ["10.0.16.0/20", "10.0.48.0/20", "10.0.80.0/20"]
    private_subnets = ["10.0.0.0/20", "10.0.32.0/20", "10.0.64.0/20"]
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
