resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id               = local.redis.cluster_id
  engine                   = local.redis.engine
  node_type                = local.redis.node_type
  num_cache_nodes          = local.redis.num_cache_nodes
  parameter_group_name     = local.redis.parameter_group_name
  engine_version           = local.redis.engine_version
  port                     = local.redis.port
  snapshot_retention_limit = local.redis.snapshot_retention_limit
}
