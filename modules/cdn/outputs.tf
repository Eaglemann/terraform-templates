output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront distribution"
  value       = module.cdn.cloudfront_distribution_id
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name corresponding to the distribution"
  value       = module.cdn.cloudfront_distribution_domain_name
}
