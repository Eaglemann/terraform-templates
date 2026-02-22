output "redis_endpoint" {
  description = "The DNS name of the Redis cluster"
  value       = aws_elasticache_replication_group.redis.primary_endpoint_address
}

output "redis_port" {
  description = "The port used to connect to the Redis cluster"
  value       = aws_elasticache_replication_group.redis.port
}
