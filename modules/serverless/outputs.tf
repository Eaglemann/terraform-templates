output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda_function.lambda_function_arn
}

output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = module.lambda_function.lambda_function_name
}

output "apigw_http_endpoint" {
  description = "The HTTP endpoint for the API Gateway"
  value       = module.api_gateway.apigatewayv2_api_api_endpoint
}
