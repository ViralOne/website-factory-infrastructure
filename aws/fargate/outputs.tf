output "alb_hostname" {
  value = aws_lb.main.dns_name
}

output "redis_arn" {
  value = aws_elasticache_cluster.redis_cluster.arn
}
